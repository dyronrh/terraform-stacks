# components.tfstack.hcl

required_providers {
  azurerm = {
    source  = "hashicorp/azurerm"
    version = "4.6.0"
  }
}

provider "azurerm" "this" {
  config {
    features {}
    tenant_id       = "f8667506-a537-4c81-842a-41fd0e547e43"
    subscription_id = var.subscription_id
    use_cli         = false
    use_oidc        = true
    oidc_token      = var.identity_token
    client_id       = var.client_id
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