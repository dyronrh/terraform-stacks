resource "azurerm_virtual_network" "stacks-vnet" {
  name                = var.name
  location            = var.region
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  dns_servers         = var.dns_servers
}