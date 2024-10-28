resource "azurerm_resource_group" "resource_group" {
  name     = "rg-stacks-demo-${var.resource_group_name}"
  location = var.location
}
