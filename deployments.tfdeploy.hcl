# deployments.tfdeploy.hcl

identity_token "azurerm" {
  audience = ["api://AzureADTokenExchange"]
}

deployment "dev" {
  inputs = {
    identity_token  = identity_token.azurerm.jwt
    client_id       = "3c560798-40da-4a08-84fa-ca3b97b53647"
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

  "client_id" = "be9ec410-ac7e-4f80-97bd-01c7914adb72"
  "subscription_id" = "283b7b64-24dd-481d-98bf-a117f9168256"
  "tenant_id" = "3c560798-40da-4a08-84fa-ca3b97b53647"