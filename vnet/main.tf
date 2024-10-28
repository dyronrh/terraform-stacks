resource "azurerm_resource_group" "resource_group" {
  name     = "rg-stacks-demo-${var.name_suffix}"
  location = var.region
}
resource "azurerm_virtual_network" "stacks-vnet" {
  name                = "vnet-${var.name_suffix}"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  address_space       = var.address_space
  dns_servers         = var.dns_servers
}