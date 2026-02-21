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
    type = list(string)
}
variable "auto_scaling" {
    type = bool
}
# variable "aks_principal_id" {}
variable "k8s_version" {
    type = string
}
variable "system_node_pool" {
    type = map(string)
  
}



variable "vnet_cidr" {}

variable "aks_subnet_cidr" {}