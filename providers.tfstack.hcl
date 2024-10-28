# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

required_providers {
  azurerm = {
    source  = "hashicorp/azurerm"
    version = "~> 4.0"
  }

  random = {
    source  = "hashicorp/random"
    version = "~> 3.6.3"
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
