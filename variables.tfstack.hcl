# variables.tfstack.hcl

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
}

variable "environment" {
  description = "The environment that the stack is being deployed to."
  type        = string
}

variable "subscription_id" {
  description = "The Azure subscription ID."
  type        = string
}

variable "identity_token" {
  description = "The OIDC token for the identity."
  ephemeral   = true
  type        = string
}

variable "client_id" {
  description = "The client ID for the identity."
  type        = string
}


variable "name_suffix" {
  type        = string
  description = "Name suffix for resource names"
}
