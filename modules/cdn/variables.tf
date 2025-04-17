variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region to deploy the resources."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account for the static website."
  type        = string
}

variable "cdn_profile_name" {
  description = "The name of the CDN profile."
  type        = string
}

variable "cdn_endpoint_name" {
  description = "The name of the CDN endpoint."
  type        = string
}

variable "origin_host_name" {
  description = "The hostname of the origin (static website)."
  type        = string
}

variable "custom_domain_name" {
  description = "The custom domain name to associate with the CDN endpoint."
  type        = string
}