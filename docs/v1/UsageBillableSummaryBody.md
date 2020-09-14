# DatadogAPIClient::V1::UsageBillableSummaryBody

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account_billable_usage** | **Integer** | The total account usage. | [optional] 
**elapsed_usage_hours** | **Integer** | Elapsed usage hours for some billable product. | [optional] 
**first_billable_usage_hour** | **DateTime** | The first billable hour for the org. | [optional] 
**last_billable_usage_hour** | **DateTime** | The last billable hour for the org. | [optional] 
**org_billable_usage** | **Integer** | The number of units used within the billable timeframe. | [optional] 
**percentage_in_account** | **Float** | The percentage of account usage the org represents. | [optional] 
**usage_unit** | **String** | Units pertaining to the usage. | [optional] 

## Code Sample

```ruby
require 'DatadogAPIClient::V1'

instance = DatadogAPIClient::V1::UsageBillableSummaryBody.new(account_billable_usage: null,
                                 elapsed_usage_hours: null,
                                 first_billable_usage_hour: null,
                                 last_billable_usage_hour: null,
                                 org_billable_usage: null,
                                 percentage_in_account: null,
                                 usage_unit: null)
```

