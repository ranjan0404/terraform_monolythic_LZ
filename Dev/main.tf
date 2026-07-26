variable "RG"{}
variable "vnet" {}
variable "subnet" {}

module "resource_group" {
  source ="../../Child/resource"
RG = var.RG
}

module "vnet" {
    source ="../../Child/virtualnetwork"
    depends_on = [ module.resource_group ]
    vnet = var.vnet
}

module "subnet" {
    source ="../../Child/Subnet"
    depends_on = [ module.vnet ]
    subnet = var.subnet
}