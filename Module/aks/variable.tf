variable "vm_size" {
  type = string 
}
variable "aks_name" {
  type = string
}
variable "rg_name" {
  type = string
}
variable "location" {
  type = string
}
variable "user_node_pools" {
  type = map(string)
}
variable "auto_scaling" {
  type = bool
}
variable "system_node_pool" {
  type = map(string)
}
variable "subnet_id" {}

variable "log_analytics_id" {
  type = string
}
variable "kubernetes_version" {
  type = string
}
variable "private_dns_zone_id" {
  description = "Private DNS Zone ID"
  type        = string
}
