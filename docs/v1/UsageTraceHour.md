# DatadogAPIClient::V1::UsageTraceHour

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**hour** | **DateTime** | The hour for the usage. | [optional] 
**indexed_events_count** | **Integer** | Contains the number of Analyzed Spans indexed. | [optional] 

## Code Sample

```ruby
require 'DatadogAPIClient::V1'

instance = DatadogAPIClient::V1::UsageTraceHour.new(hour: null,
                                 indexed_events_count: null)
```

