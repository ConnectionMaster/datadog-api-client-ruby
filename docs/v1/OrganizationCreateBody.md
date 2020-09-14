# DatadogAPIClient::V1::OrganizationCreateBody

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**billing** | [**OrganizationBilling**](OrganizationBilling.md) |  | 
**name** | **String** | The name of the new child-organization, limited to 32 characters. | 
**subscription** | [**OrganizationSubscription**](OrganizationSubscription.md) |  | 

## Code Sample

```ruby
require 'DatadogAPIClient::V1'

instance = DatadogAPIClient::V1::OrganizationCreateBody.new(billing: null,
                                 name: New child org,
                                 subscription: null)
```

