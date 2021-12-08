# Create an Azure App Service

resource "azurerm_app_service_plan" "plan" {
    name                = var.plan_name
    location            = var.location
    resource_group_name = azurerm_resource_group.rg.name
    kind                = var.plan_kind
    reserved            = var.plan_reserved

    sku {
        tier = var.plan_sku_tier
        size = var.plan_sku_size
    }
}

#https://stackoverflow.com/questions/59914397/how-to-configure-an-azure-app-service-to-pull-images-from-an-acr-with-terraform

resource "azurerm_app_service" "as" {
    name                = var.as_name
    location            = var.location
    resource_group_name = azurerm_resource_group.rg.name
    app_service_plan_id = azurerm_app_service_plan.plan.id

    site_config {
        linux_fx_version = "DOCKER|${var.cr_name}/trackmverse:latest"
        acr_use_managed_identity_credentials = true
    }

    app_settings = {
        DOCKER_REGISTRY_SERVER_URL = "https://${var.cr_name}.azurecr.io"
    }

    identity {
        type = "SystemAssigned"
    }   
}

resource "azurerm_role_assignment" "acr" {
  role_definition_name = "AcrPull"
  scope                = azurerm_container_registry.cr.id
  principal_id         = data.azurerm_client_config.current.object_id
}