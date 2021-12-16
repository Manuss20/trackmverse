# Create an Azure IoT Hub
resource "azurerm_iothub" "iothub" {
  name                = var.iot_hub_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location

  sku {
    name     = var.iot_hub_sku
    capacity = var.iot_hub_capacity
  }

  endpoint {
    type                       = var.iot_hub_endpoint_type
    connection_string          = azurerm_storage_account.sta.primary_blob_connection_string
    name                       = "export"
    batch_frequency_in_seconds = 60
    max_chunk_size_in_bytes    = 10485760
    container_name             = azurerm_storage_container.sta_container_iot.name
    encoding                   = "Avro"
    file_name_format           = "{iothub}/{partition}_{YYYY}_{MM}_{DD}_{HH}_{mm}"
  }

  endpoint {
    type              = "AzureIotHub.EventHub"
    connection_string = azurerm_eventhub_authorization_rule.evhubiotauthorize.primary_connection_string
    name              = "export2"
  }

  route {
    name           = "export"
    source         = "DeviceMessages"
    condition      = "true"
    endpoint_names = ["export"]
    enabled        = true
  }

  route {
    name           = "export2"
    source         = "DeviceMessages"
    condition      = "true"
    endpoint_names = ["export2"]
    enabled        = true
  }

  tags             = var.tags
}