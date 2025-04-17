resource "azurerm_cdn_profile" "cdn_profile" {
  name                = var.cdn_profile_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard_Microsoft"
}

resource "azurerm_cdn_endpoint" "cdn_endpoint" {
  name                = var.cdn_endpoint_name
  profile_name        = azurerm_cdn_profile.cdn_profile.name
  location            = var.location
  resource_group_name = var.resource_group_name

  origin {
    name      = "static-website-origin"
    host_name = var.origin_host_name
  }

  delivery_rule {
    name  = "EnforceHTTPS"
    order = 1

    request_scheme_condition {
      operator     = "Equal"
      match_values = ["HTTP"]
    }

    url_redirect_action {
      redirect_type = "Found"
      protocol      = "Https"
    }
  }
}

resource "azurerm_cdn_endpoint_custom_domain" "custom_domain" {
  name            = "svcs-domain"
  cdn_endpoint_id = azurerm_cdn_endpoint.cdn_endpoint.id
  host_name       = var.custom_domain_name

  # Optional: Enable HTTPS for the custom domain
  cdn_managed_https {
    certificate_type = "Dedicated"
    protocol_type   = "ServerNameIndication"
    tls_version     = "TLS12"
  }
}

output "cdn_endpoint_hostname" {
  value = azurerm_cdn_endpoint.cdn_endpoint.fqdn
}

output "custom_domain_name" {
  value = azurerm_cdn_endpoint_custom_domain.custom_domain.host_name
}