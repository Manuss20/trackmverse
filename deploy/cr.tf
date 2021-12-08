# Create an Azure Container Registry
resource "azurerm_container_registry" "cr" {
  name                = var.cr_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  sku                 = var.cr_sku
  admin_enabled       = var.cr_admin_enabled
  tags                = var.tags
}