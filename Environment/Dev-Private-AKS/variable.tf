variable "vm_size" {}
variable "aks_name" {}
variable "rg_name" {}
variable "location" {}
variable "user_node_pools" {}
variable "auto_scaling" {
    type = bool
}
variable "aks_principal_id" {}
variable "k8s_version" {}
variable "system_node_pool" {
    type = map(string)
  
}



variable "vnet_cidr" {}

variable "aks_subnet_cidr" {}