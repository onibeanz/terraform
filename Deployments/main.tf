// Module values are set dynamically, refer to terraform.tfvars for variable values

locals {
  workspace-suffix = terraform.workspace == "default" ? "" : terraform.workspace
  base-name-and-suffix = "${var.base-name}-${local.workspace-suffix}"
}

resource "random_string" "random" {
  length  = 8
  special = false
  upper = false
}

module "Backend" {
  source = "../Modules/Backend"
  base-name = var.base-name
  random-string = random_string.random.result
  workspace-suffix = local.workspace-suffix
  storage-account-tier = var.storage-account-tier
  storage-account-type = var.storage-account-type
}

module "Web" {
  source = "../Modules/Web"
  base-name = var.base-name
  workspace-suffix = local.workspace-suffix
  random-string = random_string.random.result
  storage-account-tier = var.storage-account-tier
  storage-account-type = var.storage-account-type
  location = module.Backend.rg-location
  rg-name = module.Backend.rg-name
}

module "Network" {
  source = "../Modules/Network"
  base-name = var.base-name
  location = module.Backend.rg-location
  rg-name = module.Backend.rg-name
}

module "Database" {
  source = "../Modules/Database"
  base-name = var.base-name
  workspace-suffix = local.workspace-suffix
  random-string = random_string.random.result
  location = module.Backend.rg-location
  rg-name = module.Backend.rg-name
  admin-password = module.Backend.secret-password
}

output "primary_web_endpoint" {
  value = module.Web.primary_web_endpoint
}

output "public_ip" {
  value = module.Network.public_ip
}