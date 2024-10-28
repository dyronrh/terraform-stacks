terraform {
  required_version = "~> 1.6"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

variable "name_suffix" {
  type        = string
  description = "Name suffix for resources"
}

resource "azurerm_resource_group" "this" {
  name     = "rg-stacks-demo-${var.name_suffix}"
  location = var.location
}

output "resource_group" {
  description = "Azure resource group"
  value = {
    id       = azurerm_resource_group.this.id
    name     = azurerm_resource_group.this.name
    location = azurerm_resource_group.this.location
  }
}
