component "vnet" {

  source = "./vnet"

  inputs = {
    resource_group_name = var.resource_group_name
    region              = var.region
    address_space       = var.address_space
    dns_servers         = var.dns_servers
    name                = var.name
  }

  providers = {
   azurerm = provider.azurerm.this
  }
}