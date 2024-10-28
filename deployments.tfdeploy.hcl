# deployments.tfdeploy.hcl

identity_token "azurerm" {
  audience = ["api://AzureADTokenExchange"]
}

deployment "dev" {
  inputs = {
    identity_token  = identity_token.azurerm.jwt
    client_id       = "64299473-5821-4715-b3e1-071fa254d83f"
    subscription_id = "283b7b64-24dd-481d-98bf-a117f9168256"
    location        = "East US"
    environment     = "dev"
    vnet_name       = "vnet-stacks-dev"
    vnet_prefix     = "10.1.0.0/16"
    subnet_name     = "snet-stacks-dev"
    subnet_prefix   = "10.1.1.0/24"
    vm_name         = "vm-stacks"
    vm_username     = "stacks"
    vm_password     = "Password1234!"
  }
}

orchestrate "auto_approve" "dev_only" {
  check {
    condition = context.plan.deployment == deployment.dev
    reason    = "Plan is not targeting dev."
  }

  check {
    condition = context.plan.applyable
    reason    = "Changes are not applyable."
  }
}
