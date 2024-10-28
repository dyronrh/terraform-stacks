# components.tfstack.hcl

required_providers {
  azurerm = {
    source  = "hashicorp/azurerm"
    version = "4.6.0"
  }
}


component "resource_group" {
  source = "./modules/resource-group"

  inputs = {
    location    = var.location
    resource_group_name = var.resource_group_name
  }

  providers = {
    azurerm = provider.azurerm.this
  }
}