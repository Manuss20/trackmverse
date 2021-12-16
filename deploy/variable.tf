# Commons
variable "location" {
  description = "(Required) Location of the all services to be created"
  default="westus"
}

variable "resource_group_name" {
  description = "(Required) Resource group name of the all services to be created"
  default= "trackmverse"
}

variable "tags" {
  description = "(Required) Tags to be applied to the all services to be created"
  default = { Project = "trackmverse", Department = "trackmverse I+D+i", Owner="Manuel Sánchez" }
}

# Storage Account
variable "name-sta" {
  description = "(Required) Name of Storage Account"
  default="trackmversesta"
}

variable "sku-sta" {
  description = "(Required) Sku Storage Account"
  default="Standard"
}

variable "replication-type-sta" {
  description = "(Required) Replication type on Storage Account"
  default="LRS"
}

variable "http-traffic-only-sta" {
  description = "(Required) http-traffic-only-sta Storage Account"
  default=true
}

variable "name-sta-container" {
  description = "(Required) Name of Storage Account Container"
  default="trackmverse-logs"
}

variable "name-sta-container-iot" {
  description = "(Required) Name of Storage Account Container"
  default="trackmverse-iot-logs"
}

variable "access-type-sta-container" {
  description = "(Required) Access Type of Storage Account Container"
  default="private"
}

# Azure Maps
variable "maps_name"{
  description = "(Required) Name of Azure Maps instance"
  default = "trackmversemaps"
}

variable "maps_sku"{
  description = "(Required) SKU of Azure Maps instance"
  default = "S1"
}

# Azure SignalR
variable "signalr_name"{
  description = "(Required) Name of SignalR instance"
  default = "trackmverse"
}

variable "signalr_sku"{
  description = "(Required) SKU of SignalR instance"
  default = "Free_F1"
}

variable "signalr_sku_capacity"{
  description = "(Required) Capacity SKU of SignalR instance"
  default = 1
}

#Azure EventHub
variable "event_hub_name_space" {
  description = "(Required) Event Hub Space name"
  default = "trackmversespace"
}

variable "event_hub_name_space_sku" {
  description = "(Required) Event Hub Space SKU"
  default = "Basic"
}

variable "event_hub_name" {
  description = "(Required) Event Hub Name instance"
  default = "trackmverse"
}

variable "event_hub_partition_count" {
  description = "(Required) Event Hub Partition Count instance"
  default = 2
}

variable "event_hub_message_retention" {
  description = "(Required) Event Hub Message Retention instance"
  default = 1
}

variable "eventhub_auth_rule_name" {
  description = "(Required) Event Hub Authorization Rule Name"
  default = "acctest"
}

variable "eventhub_auth_rule_send" {
  description = "(Required) Event Hub Authorization Rule Send"
  default = true
}


#Azure IoT Hub
variable "iot_hub_name" {
  description = "(Required) Name of IoT Hub instance"
  default = "trackmverse"
}

variable "iot_hub_sku"{
  description = "(Required) SKU of IoT Hub instance"
  default = "S1"
}

variable "iot_hub_capacity"{
  description = "(Required) Capacity SKU of IoT Hub instance"
  default = 1
}

variable "iot_hub_endpoint_type"{
  description = "(Required) Endpoint Type IoT Hub instance"
  default = "AzureIotHub.StorageContainer"
}

#Azure Container Registry

variable "cr_name"{
  description = "(Required) Name of Azure Container Registry"
  default = "trackmverse"
}

variable "cr_sku"{
  description = "(Required) Sku of Azure Container Registry"
  default = "Premium"
}

variable "cr_admin_enabled"{
  description = "(Required) Admin enabled of Azure Container Registry"
  default = false
}

#Azure App Service Plan
variable "plan_name"{
  description = "(Required) Name of Azure App Service Plan"
  default = "trackmverse"
}

variable "plan_kind"{
  description = "(Required) Kind of Azure App Service Plan"
  default = "Linux"
}

variable "plan_reserved"{
  description = "(Required) Reserved instance of Azure App Service Plan"
  default = true
}

variable "plan_sku_tier"{
  description = "(Required) SKU Tier of Azure App Service Plan"
  default = "Basic"
}

variable "plan_sku_size"{
  description = "(Required) SKU Size of Azure App Service Plan"
  default = "B1"
}

#Azure App Service
variable "as_name" {
  description = "(Required) Name of Azure App Service"
  default = "trackmverse"
}

variable "SubscriptionID" {
  description = "Your subscription Id"
  default     = "Your subscription Id"
}


