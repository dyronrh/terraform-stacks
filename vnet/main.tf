resource "azurerm_resource_group" "resource_group" {
  name     = "rg-stacks-demo-${var.name_suffix}"
  location = var.region
}
