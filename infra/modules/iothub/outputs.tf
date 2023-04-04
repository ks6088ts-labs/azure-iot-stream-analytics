output "name" {
  value = azurerm_iothub.iothub.name
}

output "primary_key" {
  value = azurerm_iothub.iothub.shared_access_policy[0].primary_key
}
