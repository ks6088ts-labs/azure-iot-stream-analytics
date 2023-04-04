resource "azurerm_storage_account" "storage_account" {
  location                 = var.location
  resource_group_name      = var.rg_name
  tags                     = var.tags
  name                     = var.storage_account
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "storage_container" {
  name                  = "sc${var.storage_account}"
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
}
