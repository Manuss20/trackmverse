# Create an Azure SignalR Service
resource "azurerm_signalr_service" "example" {
  name                = var.signalr_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  sku {
    name              = var.signalr_sku
    capacity          = var.signalr_sku_capacity
  }

  tags                = var.tags
}