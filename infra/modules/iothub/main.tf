resource "azurerm_iothub" "iothub" {
  location            = var.location
  resource_group_name = var.rg_name
  tags                = var.tags
  name                = var.iothub_name
  sku {
    name     = var.sku
    capacity = var.capacity
  }
}
