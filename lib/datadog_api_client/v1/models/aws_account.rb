=begin
#Datadog API V1 Collection

#Collection of all Datadog Public endpoints.

The version of the OpenAPI document: 1.0
Contact: support@datadoghq.com
Generated by: https://openapi-generator.tech

 Unless explicitly stated otherwise all files in this repository are licensed under the Apache-2.0 License.
 This product includes software developed at Datadog (https://www.datadoghq.com/).
 Copyright 2020-Present Datadog, Inc.

=end

require 'date'
require 'time'

module DatadogAPIClient::V1
  # Returns the AWS account associated with this integration.
  class AWSAccount
    # Your AWS access key ID. Only required if your AWS account is a GovCloud or China account.
    attr_accessor :access_key_id

    # Your AWS Account ID without dashes.
    attr_accessor :account_id

    # An object, (in the form `{\"namespace1\":true/false, \"namespace2\":true/false}`), that enables or disables metric collection for specific AWS namespaces for this AWS account only.
    attr_accessor :account_specific_namespace_rules

    # An array of AWS regions to exclude from metrics collection.
    attr_accessor :excluded_regions

    # The array of EC2 tags (in the form `key:value`) defines a filter that Datadog uses when collecting metrics from EC2. Wildcards, such as `?` (for single characters) and `*` (for multiple characters) can also be used. Only hosts that match one of the defined tags will be imported into Datadog. The rest will be ignored. Host matching a given tag can also be excluded by adding `!` before the tag. For example, `env:production,instance-type:c1.*,!region:us-east-1`
    attr_accessor :filter_tags

    # Array of tags (in the form `key:value`) to add to all hosts and metrics reporting through this integration.
    attr_accessor :host_tags

    # Your Datadog role delegation name.
    attr_accessor :role_name

    # Your AWS secret access key. Only required if your AWS account is a GovCloud or China account.
    attr_accessor :secret_access_key

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'access_key_id' => :'access_key_id',
        :'account_id' => :'account_id',
        :'account_specific_namespace_rules' => :'account_specific_namespace_rules',
        :'excluded_regions' => :'excluded_regions',
        :'filter_tags' => :'filter_tags',
        :'host_tags' => :'host_tags',
        :'role_name' => :'role_name',
        :'secret_access_key' => :'secret_access_key'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'access_key_id' => :'String',
        :'account_id' => :'String',
        :'account_specific_namespace_rules' => :'Hash<String, Boolean>',
        :'excluded_regions' => :'Array<String>',
        :'filter_tags' => :'Array<String>',
        :'host_tags' => :'Array<String>',
        :'role_name' => :'String',
        :'secret_access_key' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `DatadogAPIClient::V1::AWSAccount` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `DatadogAPIClient::V1::AWSAccount`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'access_key_id')
        self.access_key_id = attributes[:'access_key_id']
      end

      if attributes.key?(:'account_id')
        self.account_id = attributes[:'account_id']
      end

      if attributes.key?(:'account_specific_namespace_rules')
        if (value = attributes[:'account_specific_namespace_rules']).is_a?(Hash)
          self.account_specific_namespace_rules = value
        end
      end

      if attributes.key?(:'excluded_regions')
        if (value = attributes[:'excluded_regions']).is_a?(Array)
          self.excluded_regions = value
        end
      end

      if attributes.key?(:'filter_tags')
        if (value = attributes[:'filter_tags']).is_a?(Array)
          self.filter_tags = value
        end
      end

      if attributes.key?(:'host_tags')
        if (value = attributes[:'host_tags']).is_a?(Array)
          self.host_tags = value
        end
      end

      if attributes.key?(:'role_name')
        self.role_name = attributes[:'role_name']
      end

      if attributes.key?(:'secret_access_key')
        self.secret_access_key = attributes[:'secret_access_key']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          access_key_id == o.access_key_id &&
          account_id == o.account_id &&
          account_specific_namespace_rules == o.account_specific_namespace_rules &&
          excluded_regions == o.excluded_regions &&
          filter_tags == o.filter_tags &&
          host_tags == o.host_tags &&
          role_name == o.role_name &&
          secret_access_key == o.secret_access_key
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [access_key_id, account_id, account_specific_namespace_rules, excluded_regions, filter_tags, host_tags, role_name, secret_access_key].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      new.build_from_hash(attributes)
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.openapi_types.each_pair do |key, type|
        if attributes[self.class.attribute_map[key]].nil? && self.class.openapi_nullable.include?(key)
          self.send("#{key}=", nil)
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :Time
        Time.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when :Array
        # generic array, return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        # models (e.g. Pet) or oneOf
        klass = DatadogAPIClient::V1.const_get(type)
        klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end

        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
