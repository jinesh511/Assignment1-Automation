module "rgroup" {
    source = "./modules/rgroup"
    rg = "7301-assignment1-RG"
    location = "East Asia"
}

module "network" {
  source        = "./modules/network"
  rg            = module.rgroup.rg.name
  location      = module.rgroup.rg.location
  vnet          = "network-vnet"
  vnet_space    = ["10.0.0.0/16"]
  subnet       = "network-subnet"
  subnet_space = ["10.0.1.0/24"]
  depends_on = [module.rgroup]
}

module "common"{
  source ="./modules/common"
  rg            = module.rgroup.rg.name
  location      = module.rgroup.rg.location
  depends_on = [module.rgroup]
}

module "linux"{
  source     = "./modules/vmlinux"
  rg            = module.rgroup.rg.name
  location      = module.rgroup.rg.location
  linux_name = "n01517301-db1-u-vm1"
  linux_avs  = "linux-aset"
  nb_count   = "2"
  subnet_id = module.network.subnet.id
  depends_on = [
    module.network,
    module.common
  ]
  storage_account_uri = module.common.storage_account.primary_blob_endpoint
}

module "windows" {
  source      = "./modules/vmwindows"
  windows_avs = "availabilitySet"
  windows_name = {
    "n01517301-w-vm1" = "Standard_B1s"
  }
  rg            = module.rgroup.rg.name
  location      = module.rgroup.rg.location
  subnet_id     = module.network.subnet.id
  depends_on = [
    module.network,
    module.common
  ]
  storage_account_uri = module.common.storage_account.primary_blob_endpoint
}

module "datadisk" {
  source         = "./modules/datadisk"
  rg            = module.rgroup.rg.name
  location      = module.rgroup.rg.location
  depends_on = [
    module.linux,
    module.windows
  ]
  #windows_name = module.windows.windows_name
  windows_id   = module.windows.WVM["n01517301-w-vm1"].id
  linux_name = {
   n01517301-db1-u-vm1 = 0
   n01517301-db1-u-vm11 = 1
  }
  linux_id = module.linux.linux_id
}

module "loadbalancer"{
  source         = "./modules/loadbalancer"
  rg            = module.rgroup.rg.name
  location      = module.rgroup.rg.location
  linux_nic_id = module.linux.linux_nic_id
   depends_on = [
    module.linux
  ]
}

module "database"{
  source         = "./modules/database"
  rg            = module.rgroup.rg.name
  location      = module.rgroup.rg.location
  server_name = "n01517301-dbserver"
  depends_on  = [module.rgroup]
}