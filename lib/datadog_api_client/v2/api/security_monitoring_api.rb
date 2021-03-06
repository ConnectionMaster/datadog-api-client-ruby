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

require 'cgi'

module DatadogAPIClient::V2
  class SecurityMonitoringApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Create a detection rule
    # Create a detection rule.
    # @param body [SecurityMonitoringRuleCreatePayload] 
    # @param [Hash] opts the optional parameters
    # @return [SecurityMonitoringRuleResponse]
    def create_security_monitoring_rule(body, opts = {})
      data, _status_code, _headers = create_security_monitoring_rule_with_http_info(body, opts)
      data
    end

    # Create a detection rule
    # Create a detection rule.
    # @param body [SecurityMonitoringRuleCreatePayload] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(SecurityMonitoringRuleResponse, Integer, Hash)>] SecurityMonitoringRuleResponse data, response status code and response headers
    def create_security_monitoring_rule_with_http_info(body, opts = {})

      if @api_client.config.unstable_operations.has_key?(:create_security_monitoring_rule)
        unstable_enabled = @api_client.config.unstable_operations[:create_security_monitoring_rule]
        if unstable_enabled
          @api_client.config.logger.warn format("Using unstable operation '%s'", "create_security_monitoring_rule")
        else
          raise ApiError.new(message: format("Unstable operation '%s' is disabled", "create_security_monitoring_rule"))
        end
      end

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SecurityMonitoringApi.create_security_monitoring_rule ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling SecurityMonitoringApi.create_security_monitoring_rule"
      end
      # resource path
      local_var_path = '/api/v2/security_monitoring/rules'

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
      return_type = opts[:debug_return_type] || 'SecurityMonitoringRuleResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['apiKeyAuth', 'appKeyAuth']

      new_options = opts.merge(
        :operation => :"SecurityMonitoringApi.create_security_monitoring_rule",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SecurityMonitoringApi#create_security_monitoring_rule\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete an existing rule
    # Delete an existing rule. Default rules cannot be deleted.
    # @param rule_id [String] The ID of the rule.
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_security_monitoring_rule(rule_id, opts = {})
      delete_security_monitoring_rule_with_http_info(rule_id, opts)
      nil
    end

    # Delete an existing rule
    # Delete an existing rule. Default rules cannot be deleted.
    # @param rule_id [String] The ID of the rule.
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_security_monitoring_rule_with_http_info(rule_id, opts = {})

      if @api_client.config.unstable_operations.has_key?(:delete_security_monitoring_rule)
        unstable_enabled = @api_client.config.unstable_operations[:delete_security_monitoring_rule]
        if unstable_enabled
          @api_client.config.logger.warn format("Using unstable operation '%s'", "delete_security_monitoring_rule")
        else
          raise ApiError.new(message: format("Unstable operation '%s' is disabled", "delete_security_monitoring_rule"))
        end
      end

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SecurityMonitoringApi.delete_security_monitoring_rule ...'
      end
      # verify the required parameter 'rule_id' is set
      if @api_client.config.client_side_validation && rule_id.nil?
        fail ArgumentError, "Missing the required parameter 'rule_id' when calling SecurityMonitoringApi.delete_security_monitoring_rule"
      end
      # resource path
      local_var_path = '/api/v2/security_monitoring/rules/{rule_id}'.sub('{' + 'rule_id' + '}', CGI.escape(rule_id.to_s))

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
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['apiKeyAuth', 'appKeyAuth']

      new_options = opts.merge(
        :operation => :"SecurityMonitoringApi.delete_security_monitoring_rule",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SecurityMonitoringApi#delete_security_monitoring_rule\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get a rule's details
    # Get a rule's details.
    # @param rule_id [String] The ID of the rule.
    # @param [Hash] opts the optional parameters
    # @return [SecurityMonitoringRuleResponse]
    def get_security_monitoring_rule(rule_id, opts = {})
      data, _status_code, _headers = get_security_monitoring_rule_with_http_info(rule_id, opts)
      data
    end

    # Get a rule&#39;s details
    # Get a rule&#39;s details.
    # @param rule_id [String] The ID of the rule.
    # @param [Hash] opts the optional parameters
    # @return [Array<(SecurityMonitoringRuleResponse, Integer, Hash)>] SecurityMonitoringRuleResponse data, response status code and response headers
    def get_security_monitoring_rule_with_http_info(rule_id, opts = {})

      if @api_client.config.unstable_operations.has_key?(:get_security_monitoring_rule)
        unstable_enabled = @api_client.config.unstable_operations[:get_security_monitoring_rule]
        if unstable_enabled
          @api_client.config.logger.warn format("Using unstable operation '%s'", "get_security_monitoring_rule")
        else
          raise ApiError.new(message: format("Unstable operation '%s' is disabled", "get_security_monitoring_rule"))
        end
      end

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SecurityMonitoringApi.get_security_monitoring_rule ...'
      end
      # verify the required parameter 'rule_id' is set
      if @api_client.config.client_side_validation && rule_id.nil?
        fail ArgumentError, "Missing the required parameter 'rule_id' when calling SecurityMonitoringApi.get_security_monitoring_rule"
      end
      # resource path
      local_var_path = '/api/v2/security_monitoring/rules/{rule_id}'.sub('{' + 'rule_id' + '}', CGI.escape(rule_id.to_s))

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
      return_type = opts[:debug_return_type] || 'SecurityMonitoringRuleResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['apiKeyAuth', 'appKeyAuth']

      new_options = opts.merge(
        :operation => :"SecurityMonitoringApi.get_security_monitoring_rule",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SecurityMonitoringApi#get_security_monitoring_rule\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List rules
    # List rules.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :page_size Size for a given page. (default to 10)
    # @option opts [Integer] :page_number Specific page number to return. (default to 0)
    # @return [SecurityMonitoringListRulesResponse]
    def list_security_monitoring_rules(opts = {})
      data, _status_code, _headers = list_security_monitoring_rules_with_http_info(opts)
      data
    end

    # List rules
    # List rules.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :page_size Size for a given page.
    # @option opts [Integer] :page_number Specific page number to return.
    # @return [Array<(SecurityMonitoringListRulesResponse, Integer, Hash)>] SecurityMonitoringListRulesResponse data, response status code and response headers
    def list_security_monitoring_rules_with_http_info(opts = {})

      if @api_client.config.unstable_operations.has_key?(:list_security_monitoring_rules)
        unstable_enabled = @api_client.config.unstable_operations[:list_security_monitoring_rules]
        if unstable_enabled
          @api_client.config.logger.warn format("Using unstable operation '%s'", "list_security_monitoring_rules")
        else
          raise ApiError.new(message: format("Unstable operation '%s' is disabled", "list_security_monitoring_rules"))
        end
      end

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SecurityMonitoringApi.list_security_monitoring_rules ...'
      end
      # resource path
      local_var_path = '/api/v2/security_monitoring/rules'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'page[size]'] = opts[:'page_size'] if !opts[:'page_size'].nil?
      query_params[:'page[number]'] = opts[:'page_number'] if !opts[:'page_number'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'SecurityMonitoringListRulesResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['apiKeyAuth', 'appKeyAuth']

      new_options = opts.merge(
        :operation => :"SecurityMonitoringApi.list_security_monitoring_rules",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SecurityMonitoringApi#list_security_monitoring_rules\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get a quick list of security signals
    # The list endpoint returns security signals that match a search query. Both this endpoint and the POST endpoint can be used interchangeably when listing security signals.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :filter_query The search query for security signals.
    # @option opts [Time] :filter_from The minimum timestamp for requested security signals.
    # @option opts [Time] :filter_to The maximum timestamp for requested security signals.
    # @option opts [SecurityMonitoringSignalsSort] :sort The order of the security signals in results.
    # @option opts [String] :page_cursor A list of results using the cursor provided in the previous query.
    # @option opts [Integer] :page_limit The maximum number of security signals in the response. (default to 10)
    # @return [SecurityMonitoringSignalsListResponse]
    def list_security_monitoring_signals(opts = {})
      data, _status_code, _headers = list_security_monitoring_signals_with_http_info(opts)
      data
    end

    # Get a quick list of security signals
    # The list endpoint returns security signals that match a search query. Both this endpoint and the POST endpoint can be used interchangeably when listing security signals.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :filter_query The search query for security signals.
    # @option opts [Time] :filter_from The minimum timestamp for requested security signals.
    # @option opts [Time] :filter_to The maximum timestamp for requested security signals.
    # @option opts [SecurityMonitoringSignalsSort] :sort The order of the security signals in results.
    # @option opts [String] :page_cursor A list of results using the cursor provided in the previous query.
    # @option opts [Integer] :page_limit The maximum number of security signals in the response.
    # @return [Array<(SecurityMonitoringSignalsListResponse, Integer, Hash)>] SecurityMonitoringSignalsListResponse data, response status code and response headers
    def list_security_monitoring_signals_with_http_info(opts = {})

      if @api_client.config.unstable_operations.has_key?(:list_security_monitoring_signals)
        unstable_enabled = @api_client.config.unstable_operations[:list_security_monitoring_signals]
        if unstable_enabled
          @api_client.config.logger.warn format("Using unstable operation '%s'", "list_security_monitoring_signals")
        else
          raise ApiError.new(message: format("Unstable operation '%s' is disabled", "list_security_monitoring_signals"))
        end
      end

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SecurityMonitoringApi.list_security_monitoring_signals ...'
      end
      if @api_client.config.client_side_validation && !opts[:'page_limit'].nil? && opts[:'page_limit'] > 1000
        fail ArgumentError, 'invalid value for "opts[:"page_limit"]" when calling SecurityMonitoringApi.list_security_monitoring_signals, must be smaller than or equal to 1000.'
      end

      # resource path
      local_var_path = '/api/v2/security_monitoring/signals'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'filter[query]'] = opts[:'filter_query'] if !opts[:'filter_query'].nil?
      query_params[:'filter[from]'] = opts[:'filter_from'] if !opts[:'filter_from'].nil?
      query_params[:'filter[to]'] = opts[:'filter_to'] if !opts[:'filter_to'].nil?
      query_params[:'sort'] = opts[:'sort'] if !opts[:'sort'].nil?
      query_params[:'page[cursor]'] = opts[:'page_cursor'] if !opts[:'page_cursor'].nil?
      query_params[:'page[limit]'] = opts[:'page_limit'] if !opts[:'page_limit'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'SecurityMonitoringSignalsListResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['apiKeyAuth', 'appKeyAuth']

      new_options = opts.merge(
        :operation => :"SecurityMonitoringApi.list_security_monitoring_signals",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SecurityMonitoringApi#list_security_monitoring_signals\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get a list of security signals
    # Returns security signals that match a search query. Both this endpoint and the GET endpoint can be used interchangeably for listing security signals.
    # @param [Hash] opts the optional parameters
    # @option opts [SecurityMonitoringSignalListRequest] :body 
    # @return [SecurityMonitoringSignalsListResponse]
    def search_security_monitoring_signals(opts = {})
      data, _status_code, _headers = search_security_monitoring_signals_with_http_info(opts)
      data
    end

    # Get a list of security signals
    # Returns security signals that match a search query. Both this endpoint and the GET endpoint can be used interchangeably for listing security signals.
    # @param [Hash] opts the optional parameters
    # @option opts [SecurityMonitoringSignalListRequest] :body 
    # @return [Array<(SecurityMonitoringSignalsListResponse, Integer, Hash)>] SecurityMonitoringSignalsListResponse data, response status code and response headers
    def search_security_monitoring_signals_with_http_info(opts = {})

      if @api_client.config.unstable_operations.has_key?(:search_security_monitoring_signals)
        unstable_enabled = @api_client.config.unstable_operations[:search_security_monitoring_signals]
        if unstable_enabled
          @api_client.config.logger.warn format("Using unstable operation '%s'", "search_security_monitoring_signals")
        else
          raise ApiError.new(message: format("Unstable operation '%s' is disabled", "search_security_monitoring_signals"))
        end
      end

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SecurityMonitoringApi.search_security_monitoring_signals ...'
      end
      # resource path
      local_var_path = '/api/v2/security_monitoring/signals/search'

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'body'])

      # return_type
      return_type = opts[:debug_return_type] || 'SecurityMonitoringSignalsListResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['apiKeyAuth', 'appKeyAuth']

      new_options = opts.merge(
        :operation => :"SecurityMonitoringApi.search_security_monitoring_signals",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SecurityMonitoringApi#search_security_monitoring_signals\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update an existing rule
    # Update an existing rule. When updating `cases`, `queries` or `options`, the whole field must be included. For example, when modifying a query all queries must be included. Default rules can only be updated to be enabled and to change notifications.
    # @param rule_id [String] The ID of the rule.
    # @param body [SecurityMonitoringRuleUpdatePayload] 
    # @param [Hash] opts the optional parameters
    # @return [SecurityMonitoringRuleResponse]
    def update_security_monitoring_rule(rule_id, body, opts = {})
      data, _status_code, _headers = update_security_monitoring_rule_with_http_info(rule_id, body, opts)
      data
    end

    # Update an existing rule
    # Update an existing rule. When updating &#x60;cases&#x60;, &#x60;queries&#x60; or &#x60;options&#x60;, the whole field must be included. For example, when modifying a query all queries must be included. Default rules can only be updated to be enabled and to change notifications.
    # @param rule_id [String] The ID of the rule.
    # @param body [SecurityMonitoringRuleUpdatePayload] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(SecurityMonitoringRuleResponse, Integer, Hash)>] SecurityMonitoringRuleResponse data, response status code and response headers
    def update_security_monitoring_rule_with_http_info(rule_id, body, opts = {})

      if @api_client.config.unstable_operations.has_key?(:update_security_monitoring_rule)
        unstable_enabled = @api_client.config.unstable_operations[:update_security_monitoring_rule]
        if unstable_enabled
          @api_client.config.logger.warn format("Using unstable operation '%s'", "update_security_monitoring_rule")
        else
          raise ApiError.new(message: format("Unstable operation '%s' is disabled", "update_security_monitoring_rule"))
        end
      end

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SecurityMonitoringApi.update_security_monitoring_rule ...'
      end
      # verify the required parameter 'rule_id' is set
      if @api_client.config.client_side_validation && rule_id.nil?
        fail ArgumentError, "Missing the required parameter 'rule_id' when calling SecurityMonitoringApi.update_security_monitoring_rule"
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling SecurityMonitoringApi.update_security_monitoring_rule"
      end
      # resource path
      local_var_path = '/api/v2/security_monitoring/rules/{rule_id}'.sub('{' + 'rule_id' + '}', CGI.escape(rule_id.to_s))

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
      return_type = opts[:debug_return_type] || 'SecurityMonitoringRuleResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['apiKeyAuth', 'appKeyAuth']

      new_options = opts.merge(
        :operation => :"SecurityMonitoringApi.update_security_monitoring_rule",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SecurityMonitoringApi#update_security_monitoring_rule\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
