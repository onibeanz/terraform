// Module values are set dynamically, refer to terraform.tfvars for variable values

locals {
  workspace-suffix = terraform.workspace == "default" ? "dev" : terraform.workspace
  base-name-and-suffix = "${var.base-name}-${local.workspace-suffix}"
}

module "Backend" {
  source = "./Backend"
  base-name = var.base-name
  workspace-suffix = local.workspace-suffix
  storage-account-tier = var.storage-account-tier
  storage-account-type = var.storage-account-type
}

module "Web" {
  source = "./Web"
  base-name = var.base-name
  workspace-suffix = local.workspace-suffix
  storage-account-tier = var.storage-account-tier
  storage-account-type = var.storage-account-type
  location = module.Backend.rg-location
  rg-name = module.Backend.rg-name
  }

output "primary_web_endpoint" {
  value = module.Web.primary_web_endpoint
}