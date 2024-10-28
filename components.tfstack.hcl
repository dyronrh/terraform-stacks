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
    name_suffix = var.name_suffix
  }

  providers = {
    azurerm = provider.azurerm.this
  }
}