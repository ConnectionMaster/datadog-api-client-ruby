=begin
#Datadog API V1 Collection

#Collection of all Datadog Public endpoints.

The version of the OpenAPI document: 1.0
Contact: support@datadoghq.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.0.0-SNAPSHOT

=end

require 'spec_helper'
require 'json'

# Unit tests for DatadogAPIClient::V1::SnapshotsApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'SnapshotsApi' do
  before do
    # run before each test
    @api_instance = DatadogAPIClient::V1::SnapshotsApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of SnapshotsApi' do
    it 'should create an instance of SnapshotsApi' do
      expect(@api_instance).to be_instance_of(DatadogAPIClient::V1::SnapshotsApi)
    end
  end

  # unit tests for get_graph_snapshot
  # Take graph snapshots
  # Take graph snapshots. **Note**: When a snapshot is created, there is some delay before it is available.
  # @param start The POSIX timestamp of the start of the query.
  # @param _end The POSIX timestamp of the end of the query.
  # @param [Hash] opts the optional parameters
  # @option opts [String] :metric_query The metric query.
  # @option opts [String] :event_query A query that adds event bands to the graph.
  # @option opts [String] :graph_def A JSON document defining the graph. &#x60;graph_def&#x60; can be used instead of &#x60;metric_query&#x60;. The JSON document uses the [grammar defined here](https://docs.datadoghq.com/graphing/graphing_json/#grammar) and should be formatted to a single line then URL encoded.
  # @option opts [String] :title A title for the graph. If no title is specified, the graph does not have a title.
  # @return [GraphSnapshot]
  describe 'get_graph_snapshot test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
