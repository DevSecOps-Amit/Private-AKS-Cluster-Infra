module "rg" {
  source   = "../../Module/rg"
  rg_name  = var.rg_name
  location = var.location
}


module "network" {
  source            = "../../Module/networking"
  rg_name           = module.rg.name
  location          = var.location
  vnet_cidr         = var.vnet_cidr
  aks_subnet_cidr   = var.aks_subnet_cidr
}

module "private_dns" {
  source  = "../../Module/private dns"
  rg_name = module.rg.name
  vnet_id = module.network.vnet_id
  location = var.location
}


module "log_analytics" {
  source   = "../../Module/log-analytics"
  rg_name  = module.rg.name
  location = var.location
}


module "aks" {
  source              = "../../Module/aks"
  rg_name             = module.rg.name
  location            = var.location
  aks_name            = var.aks_name
  user_node_pools     = var.user_node_pools
  auto_scaling        = var.auto_scaling
  vm_size             = var.vm_size
  system_node_pool    = var.system_node_pool
  subnet_id           = module.network.subnet_id
 private_dns_zone_id = module.private_dns.dns_zone_id
  log_analytics_id    = module.log_analytics.id
  kubernetes_version  = var.k8s_version
  
}


module "acr" {
  source            = "../../Module/acr+role assignement"
  depends_on        = [module.aks]
rg_name           = module.rg.name
  location          = var.location
  aks_principal_id  = module.aks.aks_uami_principal_id
}
