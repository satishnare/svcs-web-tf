provider "azurerm" {
  features {}
  subscription_id = "304924a9-815d-4310-858e-9dbd64bbf647"
}

terraform {
  backend "azurerm" {
    resource_group_name  = "svcs-rg"       
    storage_account_name = "terrformbackendstorage"         
    container_name       = "tfstate"                
    key                  = "svcs-website.tfstate" 
  }
}

# Create the resource group
module "resource_group" {
  source = "./modules/resource_group"

  resource_group_name = var.resource_group_name
  location            = var.location
}

# Create the backend storage account and container for Terraform state
module "backend_storage" {
  source = "./modules/backend_storage"

  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location
  storage_account_name = var.backend_storage_account_name
  container_name      = var.backend_container_name
}

# Create the static website
module "static_website" {
  source = "./modules/static_website"

  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location
  storage_account_name = var.storage_account_name
  static_website_index_document = var.static_website_index_document
  static_website_error_document = var.static_website_error_document
}

# Create the CDN
module "cdn" {
  source = "./modules/cdn"

  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location
  storage_account_name = var.storage_account_name
  cdn_profile_name    = var.cdn_profile_name
  cdn_endpoint_name   = var.cdn_endpoint_name
  origin_host_name    = module.static_website.primary_web_host
  custom_domain_name  = var.custom_domain_name
}

