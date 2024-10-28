# components.tfstack.hcl

required_providers {
  azurerm = {
    source  = "hashicorp/azurerm"
    version = "4.6.0"
  }
}

component "resource_group" {
  source = "azurerm/resources/azure//modules/resource_group"
  version = "1.1.0"

  inputs = {
    location    = var.location
    custom_name = var.resource_group_name
  }

  providers = {
    azurerm = provider.azurerm.this
  }
}