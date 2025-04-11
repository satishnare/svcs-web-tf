variable "resource_group_name" {
  description = "The name of the resource group in which to create the resources."
  type        = string
}

variable "location" {
  description = "The Azure region to deploy the resources."
  type        = string
}

variable "backend_storage_account_name" {
  description = "The name of the backend storage account for Terraform state."
  type        = string
}

variable "backend_container_name" {
  description = "The name of the container in the backend storage account for Terraform state."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account for the static website."
  type        = string
}

variable "static_website_index_document" {
  description = "The name of the index document for the static website."
  type        = string
  default     = "index.html"
}

variable "static_website_error_document" {
  description = "The name of the error document for the static website."
  type        = string
  default     = "error.html"
}

variable "cdn_profile_name" {
  description = "The name of the CDN profile."
  type        = string
}

variable "cdn_endpoint_name" {
  description = "The name of the CDN endpoint."
  type        = string
}

variable "custom_domain_name" {
  description = "The custom domain name to associate with the CDN endpoint."
  type        = string
}