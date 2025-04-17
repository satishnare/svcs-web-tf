resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  static_website {
    index_document = var.static_website_index_document
    error_404_document = var.static_website_error_document
  }
}

output "primary_web_host" {
  value = azurerm_storage_account.storage.primary_web_host
}

output "primary_web_endpoint" {
  value = azurerm_storage_account.storage.primary_web_endpoint
}