locals {
  tags           = { azd-env-name : var.environment_name }
  sha            = base64encode(sha256("${var.environment_name}${var.location}${data.azurerm_client_config.current.subscription_id}"))
  resource_token = substr(replace(lower(local.sha), "[^A-Za-z0-9_]", ""), 0, 13)
}
# ------------------------------------------------------------------------------------------------------
# Deploy resource Group
# ------------------------------------------------------------------------------------------------------
resource "azurecaf_name" "rg_name" {
  name          = var.environment_name
  resource_type = "azurerm_resource_group"
  random_length = 0
  clean_input   = true
}

resource "azurerm_resource_group" "rg" {
  name     = azurecaf_name.rg_name.result
  location = var.location

  tags = local.tags
}
# ------------------------------------------------------------------------------------------------------
# IoT Hub
# ------------------------------------------------------------------------------------------------------
module "iothub" {
  source      = "./modules/iothub"
  location    = var.location
  rg_name     = azurerm_resource_group.rg.name
  tags        = merge(local.tags, { "${var.environment_name}" : "iothub" })
  iothub_name = "iothub${local.resource_token}"
}
# ------------------------------------------------------------------------------------------------------
# Storage Account
# ------------------------------------------------------------------------------------------------------
module "storage_account" {
  source          = "./modules/storage-account"
  location        = var.location
  rg_name         = azurerm_resource_group.rg.name
  tags            = merge(local.tags, { "${var.environment_name}" : "storage-account" })
  storage_account = "sa${local.resource_token}"
}
# ------------------------------------------------------------------------------------------------------
# Deploy Stream Analytics
# ------------------------------------------------------------------------------------------------------
module "stream_analytics" {
  source                          = "./modules/stream-analytics"
  location                        = var.location
  rg_name                         = azurerm_resource_group.rg.name
  tags                            = merge(local.tags, { "${var.environment_name}" : "stream-analytics" })
  job_name                        = "job${local.resource_token}"
  iothub_namespace                = module.iothub.name
  iothub_shared_access_policy_key = module.iothub.primary_key
  storage_account_name            = module.storage_account.storage_account_name
  storage_account_key             = module.storage_account.storage_account_key
  storage_container_name          = module.storage_account.storage_container_name
}
