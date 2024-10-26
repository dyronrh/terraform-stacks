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
