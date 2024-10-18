terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-sim-back"
    storage_account_name = "sasim0ai1uobicgback"
    container_name       = "scsimback"
    key                  = "backend.terraform.tfstate"
}

}

data "azurerm_client_config" "current" {}

provider "azurerm" {
  features {
    key_vault {
        purge_soft_delete_on_destroy    = false
        recover_soft_deleted_key_vaults = true
      }
    }
}

resource "azurerm_resource_group" "rg-backend" {
  name     = "rg-${var.base-name}-back"
  location = var.location
}


resource "random_string" "random" {
  length  = 10
  special = false
  upper = false
}

resource "azurerm_storage_account" "sa-backend" {
  name                     = "sa${lower(var.base-name)}${random_string.random.result}back"
  resource_group_name      = azurerm_resource_group.rg-backend.name
  location                 = azurerm_resource_group.rg-backend.location
  account_tier             = var.storage-account-tier
  account_replication_type = var.storage-account-type
}

resource "azurerm_storage_container" "sc-backend" {
  name                  = "sc${var.base-name}back"
  storage_account_name  = azurerm_storage_account.sa-backend.name
  container_access_type = "private"
}

resource "azurerm_key_vault" "kv-backend" {
  name                        = "kv-${var.base-name}-${random_string.random.result}-back"
  location                    = var.location
  resource_group_name         = azurerm_resource_group.rg-backend.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get"
    ]

    secret_permissions = [
      "Set",
      "Get",
      "List",
      "Purge",
      "Delete"
    ]

    storage_permissions = [
      "Set",
      "Get"
    ]
  }
}


resource "azurerm_key_vault_secret" "sa_backend_accesskey" {
  name         = "secret"
  value        = azurerm_storage_account.sa-backend.primary_access_key
  key_vault_id = azurerm_key_vault.kv-backend.id
}