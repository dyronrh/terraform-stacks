identity_token "azurerm" {
  audience = [ "api://AzureADTokenExchange" ]
}

deployment "development" {
  inputs = {
    name_suffix    = "development"
    resource_group_name = "youtube-stacks"
    region              = "East US"
    address_space       = ["10.0.0.0/16"]
    dns_servers         = ["8.8.8.8", "8.8.8.4"]
    name                =  "youtube-rg-vnet"
 
    identity_token  = identity_token.azurerm.jwt
    client_id = "be9ec410-ac7e-4f80-97bd-01c7914adb72"
    subscription_id = "283b7b64-24dd-481d-98bf-a117f9168256"
    tenant_id = "3c560798-40da-4a08-84fa-ca3b97b53647"
  }
}

orchestrate "auto_approve" "applyable" {
  check {
    condition = context.plan.applyable
    reason    = "Changes are not applyable"
  }
}