=begin
#Datadog API V1 Collection

#Collection of all Datadog Public endpoints.

The version of the OpenAPI document: 1.0
Contact: support@datadoghq.com
Generated by: https://github.com/DataDog/datadog-api-client-ruby/tree/master/.generator

 Unless explicitly stated otherwise all files in this repository are licensed under the Apache-2.0 License.
 This product includes software developed at Datadog (https://www.datadoghq.com/).
 Copyright 2020-Present Datadog, Inc.

=end

require 'date'
require 'time'

module DatadogAPIClient::V1
  # Object containing the template variable's name, associated tag/attribute, default value and selectable values.
  class SelectableTemplateVariableItems
    include BaseGenericModel

    # The default value of the template variable.
    attr_accessor :default_value

    # Name of the template variable.
    attr_accessor :name

    # The tag/attribute key associated with the template variable.
    attr_accessor :prefix

    # The type of variable. This is to differentiate between filter variables (interpolated in query) and group by variables (interpolated into group by).
    attr_accessor :type

    # List of visible tag values on the shared dashboard.
    attr_accessor :visible_tags

    attr_accessor :additional_properties

    # Attribute mapping from ruby-style variable name to JSON key.
    # @!visibility private
    def self.attribute_map
      {
        :'default_value' => :'default_value',
        :'name' => :'name',
        :'prefix' => :'prefix',
        :'type' => :'type',
        :'visible_tags' => :'visible_tags'
      }
    end

    # Attribute type mapping.
    # @!visibility private
    def self.openapi_types
      {
        :'default_value' => :'String',
        :'name' => :'String',
        :'prefix' => :'String',
        :'type' => :'String',
        :'visible_tags' => :'Array<String>'
      }
    end

    # List of attributes with nullable: true
    # @!visibility private
    def self.openapi_nullable
      Set.new([
        :'type',
        :'visible_tags',
      ])
    end

    # Initializes the object
    # @param attributes [Hash] Model attributes in the form of hash
    # @!visibility private
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `DatadogAPIClient::V1::SelectableTemplateVariableItems` initialize method"
      end

      self.additional_properties = {}
      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          self.additional_properties[k.to_sym] = v
        else
          h[k.to_sym] = v
        end
      }

      if attributes.key?(:'default_value')
        self.default_value = attributes[:'default_value']
      end

      if attributes.key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.key?(:'prefix')
        self.prefix = attributes[:'prefix']
      end

      if attributes.key?(:'type')
        self.type = attributes[:'type']
      end

      if attributes.key?(:'visible_tags')
        if (value = attributes[:'visible_tags']).is_a?(Array)
          self.visible_tags = value
        end
      end
    end

    # Returns the object in the form of hash, with additionalProperties support.
    # @return [Hash] Returns the object in the form of hash
    # @!visibility private
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
      self.additional_properties.each_pair do |attr, value|
        hash[attr] = value
      end
      hash
    end

    # Checks equality by comparing each attribute.
    # @param o [Object] Object to be compared
    # @!visibility private
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          default_value == o.default_value &&
          name == o.name &&
          prefix == o.prefix &&
          type == o.type &&
          visible_tags == o.visible_tags &&
          additional_properties == o.additional_properties
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    # @!visibility private
    def hash
      [default_value, name, prefix, type, visible_tags, additional_properties].hash
    end
  end
end
