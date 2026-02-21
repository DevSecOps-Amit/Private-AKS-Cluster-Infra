variable "vm_size" {}
variable "aks_name" {}
variable "rg_name" {}
variable "location" {}
variable "user_node_pools" {}
variable "auto_scaling" {
  type = bool
}
variable "system_node_pool" {
  type = map(string)
}
variable "subnet_id" {}

variable "log_analytics_id" {}
variable "kubernetes_version" {
  type = string
}
variable "private_dns_zone_id" {
  description = "Private DNS Zone ID"
  type        = string
}
