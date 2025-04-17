variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region to deploy the resources."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account."
  type        = string
}

variable "static_website_index_document" {
  description = "The name of the index document for the static website."
  type        = string
}

variable "static_website_error_document" {
  description = "The name of the error document for the static website."
  type        = string
}