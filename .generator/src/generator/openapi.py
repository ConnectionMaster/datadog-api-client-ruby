import hashlib
import json
import pathlib
import random
import uuid
import yaml
import warnings
from jsonref import JsonRef
from urllib.parse import urlparse
from yaml import CSafeLoader

from . import formatter


def load(filename):
    path = pathlib.Path(filename)
    with path.open() as fp:
        return JsonRef.replace_refs(yaml.load(fp, Loader=CSafeLoader))


def get_name(schema):
    name = None
    if hasattr(schema, "__reference__"):
        name = schema.__reference__["$ref"].split("/")[-1]

    return name


def type_to_ruby(schema, alternative_name=None):
    """Return Ruby type name for the type."""
    name = get_name(schema)
    if name:
        if "enum" in schema:
            return name
        if (
            not (schema.get("additionalProperties") not in (None, False) and not schema.get("properties"))
            and schema.get("type", "object") == "object"
        ):
            return name

    type_ = schema.get("type")
    if type_ is None:
        if "items" in schema:
            type_ = "array"
        elif "properties" in schema:
            type_ = "object"
        else:
            type_ = "object"
            warnings.warn(f"Unknown type for schema: {schema} ({name or alternative_name})")

    if type_ == "integer":
        return "Integer"
    elif type_ == "number":
        return "Float"
    elif type_ == "string":
        format_ = schema.get("format")
        if format_ in {"date", "date-time"}:
            return "Time"
        elif format_ == "binary":
            return "File"
        elif format_ == "uuid":
            return "UUID"
        return "String"
    elif type_ == "boolean":
        return "Boolean"
    elif type_ == "array":
        return "Array<{}>".format(type_to_ruby(schema["items"], name + "Item" if name else None))
    elif type_ == "object":
        if "additionalProperties" in schema and not schema.get("properties"):
            return "Hash<String, {}>".format(type_to_ruby(schema["additionalProperties"]))
        return (
            alternative_name
            if alternative_name
            and ("properties" in schema or "oneOf" in schema or "anyOf" in schema or "allOf" in schema)
            else "Object"
        )
    elif type_ == "null":
        return "nil"
    else:
        raise ValueError(f"Unknown type {type_}")


def get_type_for_attribute(schema, attribute, current_name=None):
    """Return Ruby type name for the attribute."""
    child_schema = schema.get("properties", {}).get(attribute)
    alternative_name = current_name + formatter.camel_case(attribute) if current_name else None
    return type_to_ruby(child_schema, alternative_name=alternative_name)


def get_type_for_parameter(parameter):
    """Return Ruby type name for the parameter."""
    if "content" in parameter:
        assert "in" not in parameter
        for content in parameter["content"].values():
            return type_to_ruby(content["schema"])
    return type_to_ruby(parameter.get("schema"))


def child_models(schema, alternative_name=None, seen=None):
    seen = seen or set()
    current_name = get_name(schema)
    name = current_name or alternative_name

    has_sub_models = False
    if "allOf" in schema:
        has_sub_models = True
        for child in schema["allOf"]:
            yield from child_models(child, seen=seen)
    if "oneOf" in schema:
        has_sub_models = True
        for child in schema["oneOf"]:
            yield from child_models(child, seen=seen)
    if "anyOf" in schema:
        has_sub_models = True
        for child in schema["anyOf"]:
            yield from child_models(child, seen=seen)

    if "items" in schema:
        yield from child_models(
            schema["items"],
            alternative_name=name + "Item" if name is not None else None,
            seen=seen,
        )

    if (schema.get("type") == "object" or "properties" in schema or has_sub_models) and not (
        "additionalProperties" in schema and "properties" not in schema
    ):
        if not has_sub_models and name is None:
            # this is a basic map object so we don't need a type
            return

        if name is None:
            raise ValueError(f"Schema {schema} has no name")

        if name in seen:
            return

        if "properties" in schema or has_sub_models:
            seen.add(name)
            yield name, schema

        for key, child in schema.get("properties", {}).items():
            yield from child_models(child, alternative_name=name + formatter.camel_case(key), seen=seen)

    if "enum" in schema:
        if name is None:
            raise ValueError(f"Schema {schema} has no name")

        if name in seen:
            return

        seen.add(name)
        yield name, schema

    if "additionalProperties" in schema:
        nested_name = get_name(schema["additionalProperties"])
        if nested_name:
            yield from child_models(
                schema["additionalProperties"],
                alternative_name=name,
                seen=seen,
            )


def models(spec):
    name_to_schema = {}

    for path in spec["paths"]:
        if path.startswith("x-"):
            continue
        for method in spec["paths"][path]:
            operation = spec["paths"][path][method]

            for content in operation.get("parameters", []):
                if "schema" in content:
                    name_to_schema.update(dict(child_models(content["schema"])))

            for content in operation.get("requestBody", {}).get("content", {}).values():
                if "schema" in content:
                    name_to_schema.update(dict(child_models(content["schema"])))

            for response in operation.get("responses", {}).values():
                for content in response.get("content", {}).values():
                    if "schema" in content:
                        name_to_schema.update(dict(child_models(content["schema"])))

    return name_to_schema


def apis(spec):
    operations = {}

    for path in spec["paths"]:
        if path.startswith("x-"):
            continue
        for method in spec["paths"][path]:
            operation = spec["paths"][path][method]
            tag = operation.get("tags", [None])[0]
            operations.setdefault(tag, []).append((path, method, operation))

    return operations


def operation(spec, operation_id):
    for path in spec["paths"]:
        for method in spec["paths"][path]:
            operation = spec["paths"][path][method]
            if operation["operationId"] == operation_id:
                return operation
    return None


def parameters(operation):
    for content in operation.get("parameters", []):
        if "schema" in content:
            yield content["name"], content

    if "requestBody" in operation:
        if "multipart/form-data" in operation["requestBody"]["content"]:
            parent = operation["requestBody"]["content"]["multipart/form-data"]["schema"]
            for name, schema in parent["properties"].items():
                yield name, {
                    "in": "form",
                    "schema": schema,
                    "name": name,
                    "description": schema.get("description"),
                    "required": name in parent.get("required", []),
                }
        else:
            name = operation.get("x-codegen-request-body-name", "body")
            yield name, operation["requestBody"]


def parameter_schema(parameter):
    if "schema" in parameter:
        return parameter["schema"]
    if "content" in parameter:
        for content in parameter.get("content", {}).values():
            if "schema" in content:
                return content["schema"]
    raise ValueError(f"Unknown schema for parameter {parameter}")


def return_type(operation):
    for response in operation.get("responses", {}).values():
        for content in response.get("content", {}).values():
            if "schema" in content:
                return type_to_ruby(content["schema"])
        return


def accept_headers(operation):
    any_type = "*/*"
    seen = []
    for response in operation.get("responses", {}).values():
        if "content" in response:
            for media_type in response["content"].keys():
                if media_type not in seen:
                    seen.append(media_type)
        else:
            return [any_type]
    return seen


def collection_format(parameter):
    in_to_style = {
        "query": "form",
        "path": "simple",
        "header": "simple",
        "cookie": "form",
    }
    schema = parameter_schema(parameter)
    matrix = {
        ("form", False): "csv",
        ("form", True): "multi",
        # TODO add more cases from https://swagger.io/specification/#parameter-style
    }
    if schema.get("type") == "array" or "items" in schema:
        in_ = parameter.get("in", "query")
        style = parameter.get("style", in_to_style[in_])
        explode = parameter.get("explode", True if style == "form" else False)
        return matrix.get((style, explode), "multi")


def format_server(server, server_variables=None, path=""):
    url = server["url"] + path
    # replace potential path variables
    for variable, value in (server_variables or {}).items():
        url = url.replace("{" + variable + "}", value)
    # replace server variables if they were not replace before
    for variable in server["variables"]:
        if server_variables and variable in server_variables:
            continue
        url = url.replace("{" + variable + "}", server["variables"][variable]["default"])
    return urlparse(url)


def server_url_and_method(spec, operation_id, server_index=0, server_variables=None):
    for path in spec["paths"]:
        for method in spec["paths"][path]:
            operation = spec["paths"][path][method]
            if operation["operationId"] == operation_id:
                if "servers" in operation:
                    server = operation["servers"][server_index]
                else:
                    server = spec["servers"][server_index]
                return (
                    format_server(server, server_variables=server_variables, path=path).geturl(),
                    method,
                )

    raise ValueError(f"Operation {operation_id} not found")


def response_code_and_accept_type(operation, status_code=None):
    for response in operation["responses"]:
        if status_code is None:
            return int(response), next(iter(operation["responses"][response].get("content", {None: None})))
        if response == str(status_code):
            return status_code, next(iter(operation["responses"][response].get("content", {None: None})))
    return status_code, None


def request_content_type(operation, status_code=None):
    return next(iter(operation.get("requestBody", {}).get("content", {None: None})))


def response(operation, status_code=None):
    for response in operation["responses"]:
        if status_code is None or response == str(status_code):
            return list(operation["responses"][response]["content"].values())[0]["schema"]
    return None


def generate_value(schema, use_random=False, prefix=None):
    spec = schema.spec
    if not use_random:
        if "example" in spec:
            return spec["example"]
        if "default" in spec:
            return spec["default"]

    if spec["type"] == "string":
        if use_random:
            return str(
                uuid.UUID(
                    bytes=hashlib.sha256(
                        str(prefix or schema.keys).encode("utf-8"),
                    ).digest()[:16]
                )
            )
        return "string"
    elif spec["type"] == "integer":
        return random.randint(0, 32000) if use_random else len(str(prefix or schema.keys))
    elif spec["type"] == "number":
        return random.random() if use_random else 1.0 / len(str(prefix or schema.keys))
    elif spec["type"] == "boolean":
        return True
    elif spec["type"] == "array":
        return [generate_value(schema[0], use_random=use_random)]
    elif spec["type"] == "object":
        return {key: generate_value(schema[key], use_random=use_random) for key in spec["properties"]}
    else:
        raise TypeError(f"Unknown type: {spec['type']}")


class Schema:
    def __init__(self, spec, value=None, keys=None):
        self.spec = spec
        self.value = value if value is not None else generate_value
        self.keys = keys or tuple()

    def __getattr__(self, key):
        return self[key]

    def __getitem__(self, key):
        type_ = self.spec.get("type", "object")
        if type_ == "object":
            try:
                return self.__class__(
                    self.spec["properties"][key],
                    value=self.value,
                    keys=self.keys + (key,),
                )
            except KeyError:
                if "oneOf" in self.spec:
                    for schema in self.spec["oneOf"]:
                        if schema.get("type", "object") == "object":
                            try:
                                return self.__class__(
                                    schema["properties"][key],
                                    value=self.value,
                                    keys=self.keys + (key,),
                                )
                            except KeyError:
                                pass
            raise KeyError(f"{key} not found in {self.spec.get('properties', {}).keys()}: {self.spec}")
        if type_ == "array":
            return self.__class__(self.spec["items"], value=self.value, keys=self.keys + (key,))

        raise KeyError(f"{key} not found in {self.spec}")

    def __repr__(self):
        value = self.value(self)
        if isinstance(value, (dict, list)):
            return json.dumps(value, indent=2)
        return str(value)


class Operation:
    def __init__(self, name, spec, method, path):
        self.name = name
        self.spec = spec
        self.method = method
        self.path = path

    def server_url_and_method(self, spec, server_index=0, server_variables=None):
        def format_server(server, path):
            url = server["url"] + path
            # replace potential path variables
            for variable, value in server_variables.items():
                url = url.replace("{" + variable + "}", value)
            # replace server variables if they were not replace before
            for variable in server["variables"]:
                if variable in server_variables:
                    continue
                url = url.replace("{" + variable + "}", server["variables"][variable]["default"])
            return url

        server_variables = server_variables or {}
        if "servers" in self.spec:
            server = self.spec["servers"][server_index]
        else:
            server = spec["servers"][server_index]
        return format_server(server, self.path), self.method

    def response_code_and_accept_type(self):
        for response in self.spec["responses"]:
            return int(response), next(iter(self.spec["responses"][response].get("content", {None: None})))
        return None, None

    def request_content_type(self):
        return next(iter(self.spec.get("requestBody", {}).get("content", {None: None})))

    def response(self):
        for response in self.spec["responses"]:
            return Schema(next(iter((self.spec["responses"][response]["content"].values())))["schema"])

    def request(self):
        return Schema(next(iter(self.spec["requestBody"]["content"].values()))["schema"])


def get_default(operation, attribute_path):
    attrs = attribute_path.split(".")
    for name, parameter in parameters(operation):
        if name == attrs[0]:
            break
    if name == attribute_path:
        # We found a top level attribute matching the full path, let's use the default
        return parameter["schema"]["default"]

    if name == "body":
        parameter = next(iter(parameter["content"].values()))["schema"]
    for attr in attrs[1:]:
        parameter = parameter["properties"][attr]
    return parameter["default"]


def get_container(operation, attribute_path, with_type=False):
    def get_type(parameter, attribute=None):
        if with_type:
            if attribute:
                return ", {}".format(type_to_ruby(parameter_schema(parameter)["properties"][attribute]))
            return f", {get_type_for_parameter(parameter)}"
        return ""

    attribute_name = attribute_path.split(".")[0]
    for name, parameter in parameters(operation):
        if name == attribute_name:
            if parameter["required"]:
                return '{}, "{}"{}'.format(
                    name,
                    ".".join(formatter.attribute_name(a) for a in attribute_path.split(".")[1:]),
                    get_type(parameter, attribute_path.split(".")[1]),
                )
            return f'opts, "{formatter.attribute_path(attribute_path)}"{get_type(parameter)}'


def get_type_at_path(operation, attribute_path):
    content = None
    for code, response in operation.get("responses", {}).items():
        if int(code) >= 300:
            continue
        for content in response.get("content", {}).values():
            if "schema" in content:
                break
    if content is None:
        raise RuntimeError("Default response not found")
    content = content["schema"]
    if not attribute_path:
        return get_name(content.get("items"))
    for attr in attribute_path.split("."):
        content = content["properties"][attr]
    return get_name(content.get("items"))


def get_security_names(security):
    if security is None:
        return []

    auth_names = set()
    for auth in security:
        for key in auth.keys() if isinstance(auth, dict) else [auth]:
            auth_names.add(key)

    return list(auth_names)
