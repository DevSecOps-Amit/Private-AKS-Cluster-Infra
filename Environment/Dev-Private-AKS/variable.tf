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
  description = "User node pools configuration"

  type = map(object({
    name         = string
    vm_size      = string
    node_count   = number
    auto_scaling = bool
    min_count    = number
    max_count    = number
  }))
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



variable "vnet_cidr" {
    type = string
}

variable "aks_subnet_cidr" {
    type = string
}