=begin
#Datadog API V2 Collection

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

module DatadogAPIClient::V2
  # Attributes for GCP Usage Cost config post request.
  class GCPUsageCostConfigPostRequestAttributes
    include BaseGenericModel

    # The GCP account ID.
    attr_reader :billing_account_id

    # The GCP bucket name used to store the Usage Cost export.
    attr_reader :bucket_name

    # The export dataset name used for the GCP Usage Cost report.
    attr_reader :export_dataset_name

    # The export prefix used for the GCP Usage Cost report.
    attr_accessor :export_prefix

    # The name of the GCP Usage Cost report.
    attr_reader :export_project_name

    # The unique GCP service account email.
    attr_reader :service_account

    attr_accessor :additional_properties

    # Attribute mapping from ruby-style variable name to JSON key.
    # @!visibility private
    def self.attribute_map
      {
        :'billing_account_id' => :'billing_account_id',
        :'bucket_name' => :'bucket_name',
        :'export_dataset_name' => :'export_dataset_name',
        :'export_prefix' => :'export_prefix',
        :'export_project_name' => :'export_project_name',
        :'service_account' => :'service_account'
      }
    end

    # Attribute type mapping.
    # @!visibility private
    def self.openapi_types
      {
        :'billing_account_id' => :'String',
        :'bucket_name' => :'String',
        :'export_dataset_name' => :'String',
        :'export_prefix' => :'String',
        :'export_project_name' => :'String',
        :'service_account' => :'String'
      }
    end

    # Initializes the object
    # @param attributes [Hash] Model attributes in the form of hash
    # @!visibility private
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `DatadogAPIClient::V2::GCPUsageCostConfigPostRequestAttributes` initialize method"
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

      if attributes.key?(:'billing_account_id')
        self.billing_account_id = attributes[:'billing_account_id']
      end

      if attributes.key?(:'bucket_name')
        self.bucket_name = attributes[:'bucket_name']
      end

      if attributes.key?(:'export_dataset_name')
        self.export_dataset_name = attributes[:'export_dataset_name']
      end

      if attributes.key?(:'export_prefix')
        self.export_prefix = attributes[:'export_prefix']
      end

      if attributes.key?(:'export_project_name')
        self.export_project_name = attributes[:'export_project_name']
      end

      if attributes.key?(:'service_account')
        self.service_account = attributes[:'service_account']
      end
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    # @!visibility private
    def valid?
      return false if @billing_account_id.nil?
      return false if @bucket_name.nil?
      return false if @export_dataset_name.nil?
      return false if @export_project_name.nil?
      return false if @service_account.nil?
      true
    end

    # Custom attribute writer method with validation
    # @param billing_account_id [Object] Object to be assigned
    # @!visibility private
    def billing_account_id=(billing_account_id)
      if billing_account_id.nil?
        fail ArgumentError, 'invalid value for "billing_account_id", billing_account_id cannot be nil.'
      end
      @billing_account_id = billing_account_id
    end

    # Custom attribute writer method with validation
    # @param bucket_name [Object] Object to be assigned
    # @!visibility private
    def bucket_name=(bucket_name)
      if bucket_name.nil?
        fail ArgumentError, 'invalid value for "bucket_name", bucket_name cannot be nil.'
      end
      @bucket_name = bucket_name
    end

    # Custom attribute writer method with validation
    # @param export_dataset_name [Object] Object to be assigned
    # @!visibility private
    def export_dataset_name=(export_dataset_name)
      if export_dataset_name.nil?
        fail ArgumentError, 'invalid value for "export_dataset_name", export_dataset_name cannot be nil.'
      end
      @export_dataset_name = export_dataset_name
    end

    # Custom attribute writer method with validation
    # @param export_project_name [Object] Object to be assigned
    # @!visibility private
    def export_project_name=(export_project_name)
      if export_project_name.nil?
        fail ArgumentError, 'invalid value for "export_project_name", export_project_name cannot be nil.'
      end
      @export_project_name = export_project_name
    end

    # Custom attribute writer method with validation
    # @param service_account [Object] Object to be assigned
    # @!visibility private
    def service_account=(service_account)
      if service_account.nil?
        fail ArgumentError, 'invalid value for "service_account", service_account cannot be nil.'
      end
      @service_account = service_account
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
          billing_account_id == o.billing_account_id &&
          bucket_name == o.bucket_name &&
          export_dataset_name == o.export_dataset_name &&
          export_prefix == o.export_prefix &&
          export_project_name == o.export_project_name &&
          service_account == o.service_account &&
          additional_properties == o.additional_properties
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    # @!visibility private
    def hash
      [billing_account_id, bucket_name, export_dataset_name, export_prefix, export_project_name, service_account, additional_properties].hash
    end
  end
end
