# DatadogAPIClient::V1::SyntheticsDevice

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**height** | **Integer** | Screen height of the device. | 
**id** | [**SyntheticsDeviceID**](SyntheticsDeviceID.md) |  | 
**is_mobile** | **Boolean** | Whether or not the device is a mobile. | [optional] 
**name** | **String** | The device name. | 
**width** | **Integer** | Screen width of the device. | 

## Code Sample

```ruby
require 'DatadogAPIClient::V1'

instance = DatadogAPIClient::V1::SyntheticsDevice.new(height: 0,
                                 id: null,
                                 is_mobile: null,
                                 name: null,
                                 width: 0)
```

