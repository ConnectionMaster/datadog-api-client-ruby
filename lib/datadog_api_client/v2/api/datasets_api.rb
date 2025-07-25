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

require 'cgi'

module DatadogAPIClient::V2
  class DatasetsAPI
    attr_accessor :api_client

    def initialize(api_client = DatadogAPIClient::APIClient.default)
      @api_client = api_client
    end

    # Create a dataset.
    #
    # @see #create_dataset_with_http_info
    def create_dataset(body, opts = {})
      data, _status_code, _headers = create_dataset_with_http_info(body, opts)
      data
    end

    # Create a dataset.
    #
    # Create a dataset with the configurations in the request.
    #
    # @param body [DatasetCreateRequest] Dataset payload
    # @param opts [Hash] the optional parameters
    # @return [Array<(DatasetResponseSingle, Integer, Hash)>] DatasetResponseSingle data, response status code and response headers
    def create_dataset_with_http_info(body, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: DatasetsAPI.create_dataset ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling DatasetsAPI.create_dataset"
      end
      # resource path
      local_var_path = '/api/v2/datasets'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(body)

      # return_type
      return_type = opts[:debug_return_type] || 'DatasetResponseSingle'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth, :AuthZ]

      new_options = opts.merge(
        :operation => :create_dataset,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type,
        :api_version => "V2"
      )

      data, status_code, headers = @api_client.call_api(Net::HTTP::Post, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DatasetsAPI#create_dataset\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete a dataset.
    #
    # @see #delete_dataset_with_http_info
    def delete_dataset(dataset_id, opts = {})
      delete_dataset_with_http_info(dataset_id, opts)
      nil
    end

    # Delete a dataset.
    #
    # Deletes the dataset associated with the ID.
    #
    # @param dataset_id [String] The ID of a defined dataset.
    # @param opts [Hash] the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_dataset_with_http_info(dataset_id, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: DatasetsAPI.delete_dataset ...'
      end
      # verify the required parameter 'dataset_id' is set
      if @api_client.config.client_side_validation && dataset_id.nil?
        fail ArgumentError, "Missing the required parameter 'dataset_id' when calling DatasetsAPI.delete_dataset"
      end
      # resource path
      local_var_path = '/api/v2/datasets/{dataset_id}'.sub('{dataset_id}', CGI.escape(dataset_id.to_s).gsub('%2F', '/'))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['*/*'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth, :AuthZ]

      new_options = opts.merge(
        :operation => :delete_dataset,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type,
        :api_version => "V2"
      )

      data, status_code, headers = @api_client.call_api(Net::HTTP::Delete, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DatasetsAPI#delete_dataset\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get all datasets.
    #
    # @see #get_all_datasets_with_http_info
    def get_all_datasets(opts = {})
      data, _status_code, _headers = get_all_datasets_with_http_info(opts)
      data
    end

    # Get all datasets.
    #
    # Get all datasets that have been configured for an organization.
    #
    # @param opts [Hash] the optional parameters
    # @return [Array<(DatasetResponseMulti, Integer, Hash)>] DatasetResponseMulti data, response status code and response headers
    def get_all_datasets_with_http_info(opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: DatasetsAPI.get_all_datasets ...'
      end
      # resource path
      local_var_path = '/api/v2/datasets'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'DatasetResponseMulti'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth, :AuthZ]

      new_options = opts.merge(
        :operation => :get_all_datasets,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type,
        :api_version => "V2"
      )

      data, status_code, headers = @api_client.call_api(Net::HTTP::Get, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DatasetsAPI#get_all_datasets\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get a single dataset by ID.
    #
    # @see #get_dataset_with_http_info
    def get_dataset(dataset_id, opts = {})
      data, _status_code, _headers = get_dataset_with_http_info(dataset_id, opts)
      data
    end

    # Get a single dataset by ID.
    #
    # Retrieves the dataset associated with the ID.
    #
    # @param dataset_id [String] The ID of a defined dataset.
    # @param opts [Hash] the optional parameters
    # @return [Array<(DatasetResponseSingle, Integer, Hash)>] DatasetResponseSingle data, response status code and response headers
    def get_dataset_with_http_info(dataset_id, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: DatasetsAPI.get_dataset ...'
      end
      # verify the required parameter 'dataset_id' is set
      if @api_client.config.client_side_validation && dataset_id.nil?
        fail ArgumentError, "Missing the required parameter 'dataset_id' when calling DatasetsAPI.get_dataset"
      end
      # resource path
      local_var_path = '/api/v2/datasets/{dataset_id}'.sub('{dataset_id}', CGI.escape(dataset_id.to_s).gsub('%2F', '/'))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'DatasetResponseSingle'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth, :AuthZ]

      new_options = opts.merge(
        :operation => :get_dataset,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type,
        :api_version => "V2"
      )

      data, status_code, headers = @api_client.call_api(Net::HTTP::Get, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DatasetsAPI#get_dataset\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Edit a dataset.
    #
    # @see #update_dataset_with_http_info
    def update_dataset(dataset_id, body, opts = {})
      data, _status_code, _headers = update_dataset_with_http_info(dataset_id, body, opts)
      data
    end

    # Edit a dataset.
    #
    # Edits the dataset associated with the ID.
    #
    # @param dataset_id [String] The ID of a defined dataset.
    # @param body [DatasetUpdateRequest] Dataset payload
    # @param opts [Hash] the optional parameters
    # @return [Array<(DatasetResponseSingle, Integer, Hash)>] DatasetResponseSingle data, response status code and response headers
    def update_dataset_with_http_info(dataset_id, body, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: DatasetsAPI.update_dataset ...'
      end
      # verify the required parameter 'dataset_id' is set
      if @api_client.config.client_side_validation && dataset_id.nil?
        fail ArgumentError, "Missing the required parameter 'dataset_id' when calling DatasetsAPI.update_dataset"
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling DatasetsAPI.update_dataset"
      end
      # resource path
      local_var_path = '/api/v2/datasets/{dataset_id}'.sub('{dataset_id}', CGI.escape(dataset_id.to_s).gsub('%2F', '/'))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(body)

      # return_type
      return_type = opts[:debug_return_type] || 'DatasetResponseSingle'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth, :AuthZ]

      new_options = opts.merge(
        :operation => :update_dataset,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type,
        :api_version => "V2"
      )

      data, status_code, headers = @api_client.call_api(Net::HTTP::Put, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DatasetsAPI#update_dataset\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
