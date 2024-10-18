locals {
  web_suffix = "<h1>${terraform.workspace}</h1>"
}

resource "random_string" "random" {
  length  = 8
  special = false
  upper   = false
}

# Create Storage Account
resource "azurerm_storage_account" "sa-web" {
  name                     = "sa${lower(var.base-name)}${random_string.random.result}web${var.workspace-suffix}"
  resource_group_name      = var.rg-name
  location                 = var.location
  account_tier             = var.storage-account-tier
  account_replication_type = var.storage-account-type

  static_website {
    index_document = var.index_document
  }
}

# Add a index.html file to the storage account
resource "azurerm_storage_blob" "index-html" {
  name                   = var.index_document
  storage_account_name   = azurerm_storage_account.sa-web.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = "${var.source_content}${local.web_suffix}"
}

output "primary_web_endpoint" {
  value = azurerm_storage_account.sa-web.primary_web_endpoint
}

