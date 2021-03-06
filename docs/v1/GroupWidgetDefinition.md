# DatadogAPIClient::V1::GroupWidgetDefinition

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **layout_type** | [**WidgetLayoutType**](WidgetLayoutType.md) |  |  |
| **title** | **String** | Title of the widget. | [optional] |
| **type** | [**GroupWidgetDefinitionType**](GroupWidgetDefinitionType.md) |  | [default to &#39;group&#39;] |
| **widgets** | [**Array&lt;Widget&gt;**](Widget.md) | List of widget groups. |  |

## Example

```ruby
require 'datadog_api_client/v1'

instance = DatadogAPIClient::V1::GroupWidgetDefinition.new(
  layout_type: null,
  title: null,
  type: null,
  widgets: [{&quot;definition&quot;:{&quot;requests&quot;:{&quot;fill&quot;:{&quot;q&quot;:&quot;system.cpu.user&quot;}},&quot;type&quot;:&quot;hostmap&quot;}}]
)
```

