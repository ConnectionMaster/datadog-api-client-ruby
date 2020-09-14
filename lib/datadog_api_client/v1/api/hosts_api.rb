=begin
#Datadog API V1 Collection

#Collection of all Datadog Public endpoints.

The version of the OpenAPI document: 1.0
Contact: support@datadoghq.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.0.0-SNAPSHOT

=end

require 'cgi'

module DatadogAPIClient::V1
  class HostsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Get the total number of active hosts
    # This endpoint returns the total number of active and up hosts in your Datadog account. Active means the host has reported in the past hour, and up means it has reported in the past two hours.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :from Number of seconds from which you want to get total number of active hosts.
    # @return [HostTotals]
    def get_host_totals(opts = {})
      data, _status_code, _headers = get_host_totals_with_http_info(opts)
      data
    end

    # Get the total number of active hosts
    # This endpoint returns the total number of active and up hosts in your Datadog account. Active means the host has reported in the past hour, and up means it has reported in the past two hours.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :from Number of seconds from which you want to get total number of active hosts.
    # @return [Array<(HostTotals, Integer, Hash)>] HostTotals data, response status code and response headers
    def get_host_totals_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: HostsApi.get_host_totals ...'
      end
      # resource path
      local_var_path = '/api/v1/hosts/totals'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'from'] = opts[:'from'] if !opts[:'from'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}
      # return_type
      return_type = opts[:return_type] || 'HostTotals' 

      # auth_names
      auth_names = opts[:auth_names] || ['apiKeyAuth', 'appKeyAuth']

      new_options = opts.merge(
        :operation => :"HostsApi.get_host_totals",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => nil,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: HostsApi#get_host_totals\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get all hosts for your organization
    # This endpoint allows searching for hosts by name, alias, or tag. Hosts live within the past 3 hours are included by default. Retention is 7 days. Results are paginated with a max of 1000 results at a time.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :filter String to filter search results.
    # @option opts [String] :sort_field Sort hosts by this field.
    # @option opts [String] :sort_dir Direction of sort. Options include &#x60;asc&#x60; and &#x60;desc&#x60;.
    # @option opts [Integer] :start Host result to start search from.
    # @option opts [Integer] :count Number of hosts to return. Max 1000.
    # @option opts [Integer] :from Number of seconds since UNIX epoch from which you want to search your hosts.
    # @option opts [Boolean] :include_muted_hosts_data Include information on the muted status of hosts and when the mute expires.
    # @option opts [Boolean] :include_hosts_metadata Include additional metadata about the hosts (agent_version, machine, platform, processor, etc.).
    # @return [HostListResponse]
    def list_hosts(opts = {})
      data, _status_code, _headers = list_hosts_with_http_info(opts)
      data
    end

    # Get all hosts for your organization
    # This endpoint allows searching for hosts by name, alias, or tag. Hosts live within the past 3 hours are included by default. Retention is 7 days. Results are paginated with a max of 1000 results at a time.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :filter String to filter search results.
    # @option opts [String] :sort_field Sort hosts by this field.
    # @option opts [String] :sort_dir Direction of sort. Options include &#x60;asc&#x60; and &#x60;desc&#x60;.
    # @option opts [Integer] :start Host result to start search from.
    # @option opts [Integer] :count Number of hosts to return. Max 1000.
    # @option opts [Integer] :from Number of seconds since UNIX epoch from which you want to search your hosts.
    # @option opts [Boolean] :include_muted_hosts_data Include information on the muted status of hosts and when the mute expires.
    # @option opts [Boolean] :include_hosts_metadata Include additional metadata about the hosts (agent_version, machine, platform, processor, etc.).
    # @return [Array<(HostListResponse, Integer, Hash)>] HostListResponse data, response status code and response headers
    def list_hosts_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: HostsApi.list_hosts ...'
      end
      # resource path
      local_var_path = '/api/v1/hosts'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'filter'] = opts[:'filter'] if !opts[:'filter'].nil?
      query_params[:'sort_field'] = opts[:'sort_field'] if !opts[:'sort_field'].nil?
      query_params[:'sort_dir'] = opts[:'sort_dir'] if !opts[:'sort_dir'].nil?
      query_params[:'start'] = opts[:'start'] if !opts[:'start'].nil?
      query_params[:'count'] = opts[:'count'] if !opts[:'count'].nil?
      query_params[:'from'] = opts[:'from'] if !opts[:'from'].nil?
      query_params[:'include_muted_hosts_data'] = opts[:'include_muted_hosts_data'] if !opts[:'include_muted_hosts_data'].nil?
      query_params[:'include_hosts_metadata'] = opts[:'include_hosts_metadata'] if !opts[:'include_hosts_metadata'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}
      # return_type
      return_type = opts[:return_type] || 'HostListResponse' 

      # auth_names
      auth_names = opts[:auth_names] || ['apiKeyAuth', 'appKeyAuth']

      new_options = opts.merge(
        :operation => :"HostsApi.list_hosts",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => nil,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: HostsApi#list_hosts\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Mute a host
    # Mute a host.
    # @param host_name [String] Name of the host to mute.
    # @param [Hash] opts the optional parameters
    # @option opts [HostMuteSettings] :body Mute a host request body.
    # @return [HostMuteResponse]
    def mute_host(host_name, opts = {})
      data, _status_code, _headers = mute_host_with_http_info(host_name, opts)
      data
    end

    # Mute a host
    # Mute a host.
    # @param host_name [String] Name of the host to mute.
    # @param [Hash] opts the optional parameters
    # @option opts [HostMuteSettings] :body Mute a host request body.
    # @return [Array<(HostMuteResponse, Integer, Hash)>] HostMuteResponse data, response status code and response headers
    def mute_host_with_http_info(host_name, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: HostsApi.mute_host ...'
      end
      # verify the required parameter 'host_name' is set
      if @api_client.config.client_side_validation && host_name.nil?
        fail ArgumentError, "Missing the required parameter 'host_name' when calling HostsApi.mute_host"
      end
      # resource path
      local_var_path = '/api/v1/host/{host_name}/mute'.sub('{' + 'host_name' + '}', CGI.escape(host_name.to_s))

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
      post_body = @api_client.object_to_http_body(opts[:'body'])

      # return_type
      return_type = opts[:return_type] || 'HostMuteResponse' 

      # auth_names
      auth_names = opts[:auth_names] || ['apiKeyAuth', 'appKeyAuth']

      new_options = opts.merge(
        :operation => :"HostsApi.mute_host",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: HostsApi#mute_host\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Unmute a host
    # Unmutes a host. This endpoint takes no JSON arguments.
    # @param host_name [String] Name of the host to unmute.
    # @param [Hash] opts the optional parameters
    # @return [HostMuteResponse]
    def unmute_host(host_name, opts = {})
      data, _status_code, _headers = unmute_host_with_http_info(host_name, opts)
      data
    end

    # Unmute a host
    # Unmutes a host. This endpoint takes no JSON arguments.
    # @param host_name [String] Name of the host to unmute.
    # @param [Hash] opts the optional parameters
    # @return [Array<(HostMuteResponse, Integer, Hash)>] HostMuteResponse data, response status code and response headers
    def unmute_host_with_http_info(host_name, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: HostsApi.unmute_host ...'
      end
      # verify the required parameter 'host_name' is set
      if @api_client.config.client_side_validation && host_name.nil?
        fail ArgumentError, "Missing the required parameter 'host_name' when calling HostsApi.unmute_host"
      end
      # resource path
      local_var_path = '/api/v1/host/{host_name}/unmute'.sub('{' + 'host_name' + '}', CGI.escape(host_name.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}
      # return_type
      return_type = opts[:return_type] || 'HostMuteResponse' 

      # auth_names
      auth_names = opts[:auth_names] || ['apiKeyAuth', 'appKeyAuth']

      new_options = opts.merge(
        :operation => :"HostsApi.unmute_host",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => nil,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: HostsApi#unmute_host\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end