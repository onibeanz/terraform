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
}

# Add a blob storage for images to the storage account
resource "azurerm_storage_blob" "product-img" {
  name                   = "blob-${var.base-name}-img"
  storage_account_name   = azurerm_storage_account.sa-web.name
  storage_container_name = "$web"
  type                   = "Block"
}

# Create a service plan for the app to run on.
resource "azurerm_service_plan" "sp" {
  name                = "sp${var.base-name}"
  resource_group_name = var.rg-name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}