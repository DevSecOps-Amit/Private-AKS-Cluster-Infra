rg_name = "rg-aks-prod"
location = "westus2"

vnet_cidr       = "10.10.0.0/16"
aks_subnet_cidr = "10.10.0.0/22"

aks_name   = "prod-aks"
k8s_version = "1.33.6"

system_node_pool = {
  name       = "systempool"
  vm_size    = "standard_b2pls_v2"
  node_count = 2
}

user_node_pools = {
  apps = {
    name           = "apppool"
    vm_size        = "standard_b2pls_v2"
    node_count     = 2
    auto_scaling   = true
    min_count      = 2
    max_count      = 10
  }
}

vm_size = "Standard_D4s_v5"
auto_scaling = true
