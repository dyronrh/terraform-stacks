

variable "identity_token" { 
  type        = string 
  ephemeral   = true
  description = "Identity token for provider authentication"
}

variable "client_id" {
  type        = string
  description = "Azure app registration client ID"
}

variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
}

variable "tenant_id" {
  type        = string
  description = "Azure tenant ID"
}

variable "resource_group_name" {
  type = string
}
variable "region" {
  type = string
}
variable "address_space" {
  type = list(string)
}
variable "dns_servers" {
  type = list(string)
}
variable "name" {
  type = string
}

variable "name_suffix" {
  type        = string
  description = "Name suffix for resource names"
}