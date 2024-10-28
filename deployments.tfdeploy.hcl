# deployments.tfdeploy.hcl

identity_token "azurerm" {
  audience = ["api://AzureADTokenExchange/"]
}

deployment "dev" {
  inputs = {
    identity_token  = identity_token.azurerm.jwt
    client_id       = "62e467de-93de-4d61-b848-71b9298ac6f5"
    subscription_id = "283b7b64-24dd-481d-98bf-a117f9168256"
    location        = "East US"
    environment     = "dev"
    name_suffix     = "dev"
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
