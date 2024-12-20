# deployments.tfdeploy.hcl

identity_token "azurerm" {
  audience = ["api://AzureADTokenExchange"]
}

deployment "dev" {
  inputs = {
    identity_token  = identity_token.azurerm.jwt
    client_id       = "be9ec410-ac7e-4f80-97bd-01c7914adb72"
    subscription_id = "283b7b64-24dd-481d-98bf-a117f9168256"
    location        = "East US"
    environment     = "dev"
    name_suffix     = "dev"
  }
}

deployment "staging" {
  inputs = {
    identity_token  = identity_token.azurerm.jwt
    client_id       = "be9ec410-ac7e-4f80-97bd-01c7914adb72"
    subscription_id = "d510368a-d664-4890-9b2a-b2d4f04f295a"
    location        = "East US"
    environment     = "staging"
    name_suffix     = "staging"
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