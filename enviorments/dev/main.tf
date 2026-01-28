module "rg" {
  source = "../../modules/azurerm_rg"
  rgs = var.rgs
}

module "network" {
    depends_on = [ module.rg ]
  source = "../../modules/azurerm_nerwork"
  networks = var.networks
}

module "pip" {
    depends_on = [ module.rg ]
  source = "../../modules/azurerm_pip"
  pips = var.pips
}

module "vm" {
    depends_on = [ module.rg, module.network, module.pip, module.lb, module.nsg]
  source = "../../modules/azurerm_computes"
  vms = var.vms
}

module "sql_database" {
  depends_on = [ module.rg ]
  source = "../../modules/azurerm_sql_database"
  sql_database = var.sql_database
}

module "lb" {
  depends_on = [ module.rg, module.network, module.pip,]
  source = "../../modules/azurerm_lb"
  lbs = var.lbs
}

module "lb_association" {
 depends_on = [ module.rg, module.network, module.lb, module.vm ]
  source = "../../modules/azurerm_lb_nic_association"
  lb_association = var.lb_association
}

module "nsg" {
  depends_on = [ module.rg, module.network, ]
  source = "../../modules/azurerm_nsg"
  nsgs = var.nsgs
  
}

module "bastion" {
  depends_on = [ module.network, module.rg ]
  source = "../../modules/azurerm_bastion"
  bastion = var.bastion
}