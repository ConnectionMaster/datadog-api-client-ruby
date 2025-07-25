import pathlib

import click
from jinja2 import Environment, FileSystemLoader

from . import openapi
from . import formatter

GEM_NAME = "datadog_api_client"

MODULE_NAME = "DatadogAPIClient"


@click.command()
@click.argument(
    "specs",
    nargs=-1,
    type=click.Path(exists=True, file_okay=True, dir_okay=False, path_type=pathlib.Path),
)
@click.option(
    "-o",
    "--output",
    type=click.Path(path_type=pathlib.Path),
)
def cli(specs, output):
    """
    Generate a Ruby code snippet from OpenAPI specification.
    """
    env = Environment(loader=FileSystemLoader(str(pathlib.Path(__file__).parent / "templates")))

    env.filters["accept_headers"] = openapi.accept_headers
    env.filters["attribute_name"] = formatter.attribute_name
    env.filters["block_comment"] = formatter.block_comment
    env.filters["camel_case"] = formatter.camel_case
    env.filters["collection_format"] = openapi.collection_format
    env.filters["format_server"] = openapi.format_server
    env.filters["format_value"] = formatter.format_value
    env.filters["parameter_schema"] = openapi.parameter_schema
    env.filters["parameters"] = openapi.parameters
    env.filters["return_type"] = openapi.return_type
    env.filters["snake_case"] = formatter.snake_case
    env.filters["attribute_path"] = formatter.attribute_path
    env.filters["class_name"] = formatter.class_name
    env.globals["gem_name"] = GEM_NAME
    env.globals["module_name"] = MODULE_NAME
    env.globals["enumerate"] = enumerate
    env.globals["get_name"] = openapi.get_name
    env.globals["type_to_ruby"] = openapi.type_to_ruby
    env.globals["get_type_for_attribute"] = openapi.get_type_for_attribute
    env.globals["get_type_for_parameter"] = openapi.get_type_for_parameter
    env.globals["get_default"] = openapi.get_default
    env.globals["get_container"] = openapi.get_container
    env.globals["get_type_at_path"] = openapi.get_type_at_path
    env.globals["get_security_names"] = openapi.get_security_names

    api_j2 = env.get_template("api.j2")
    model_j2 = env.get_template("model.j2")
    package_j2 = env.get_template("package.j2")
    datadog_api_client_j2 = env.get_template("datadog_api_client.j2")

    extra_files = {
        "model_base.rb": env.get_template("model_base.j2"),
    }

    common_files = {
        "api_client.rb": env.get_template("api_client.j2"),
        "configuration.rb": env.get_template("configuration.j2"),
        "inflector.rb": env.get_template("inflector.j2"),
    }

    test_scenarios_files = {
        "scenarios_model_mapping.rb": env.get_template("scenarios_model_mapping.j2")
    }

    all_specs = {}
    all_apis = {}
    all_models = {}
    for spec_path in specs:
        version = spec_path.parent.name

        spec = openapi.load(spec_path)
        all_specs[version] = spec

        apis = openapi.apis(spec)
        all_apis[version] = apis

        models = openapi.models(spec)
        all_models[version] = models

        env.globals["openapi"] = spec
        env.globals["version"] = version

        gem_path = output / GEM_NAME / version
        gem_path.mkdir(parents=True, exist_ok=True)

        for name, template in extra_files.items():
            filename = gem_path / name
            with filename.open("w") as fp:
                fp.write(template.render(apis=apis, models=models))

        for name, model in models.items():
            filename = formatter.snake_case(name) + ".rb"
            model_path = gem_path / "models" / filename
            model_path.parent.mkdir(parents=True, exist_ok=True)
            with model_path.open("w") as fp:
                fp.write(model_j2.render(name=name, model=model))

        for name, operations in apis.items():
            filename = formatter.snake_case(name) + "_api.rb"
            api_path = gem_path / "api" / filename
            api_path.parent.mkdir(parents=True, exist_ok=True)
            with api_path.open("w") as fp:
                fp.write(api_j2.render(name=name, operations=operations))

    models_output = output / GEM_NAME / "models.rb"
    with models_output.open("w") as fp:
        fp.write(package_j2.render(all_apis=all_apis, all_models=all_models))

    common_output = output / GEM_NAME
    for name, template in common_files.items():
        filename = common_output / name
        with filename.open("w") as fp:
            fp.write(template.render(all_apis=all_apis, all_specs=all_specs, all_models=all_models))

    datadog_api_client_output = output / "datadog_api_client.rb"
    with datadog_api_client_output.open("w") as fp:
        fp.write(datadog_api_client_j2.render(all_apis=all_apis))

    # Parameter mappings for bdd tests
    scenarios_test_output = pathlib.Path("../features/")
    for name, template in test_scenarios_files.items():
        filename = scenarios_test_output / name
        with filename.open("w") as fp:
            fp.write(template.render(all_apis=all_apis))
