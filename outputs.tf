
output "backend_storage_account_name" {
  description = "The name of the backend storage account."
  value       = module.backend_storage.storage_account_name
}

output "backend_container_name" {
  description = "The name of the container in the backend storage account."
  value       = module.backend_storage.container_name
}

output "static_website_url" {
  description = "The URL of the static website."
  value       = module.static_website.primary_web_endpoint
}

output "cdn_endpoint_url" {
  description = "The URL of the CDN endpoint."
  value       = module.cdn.cdn_endpoint_hostname
}