=begin
#Datadog API V2 Collection

#Collection of all Datadog Public endpoints.

The version of the OpenAPI document: 1.0
Contact: support@datadoghq.com
Generated by: https://openapi-generator.tech

 Unless explicitly stated otherwise all files in this repository are licensed under the Apache-2.0 License.
 This product includes software developed at Datadog (https://www.datadoghq.com/).
 Copyright 2020-Present Datadog, Inc.

=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for DatadogAPIClient::V2::MetricVolumesResponse
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe DatadogAPIClient::V2::MetricVolumesResponse do
  let(:instance) { DatadogAPIClient::V2::MetricVolumesResponse.new }

  describe 'test an instance of MetricVolumesResponse' do
    it 'should create an instance of MetricVolumesResponse' do
      expect(instance).to be_instance_of(DatadogAPIClient::V2::MetricVolumesResponse)
    end
  end
  describe 'test attribute "data"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
