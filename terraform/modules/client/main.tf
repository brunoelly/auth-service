resource "keycloak_openid_client" "client" {
  realm_id                = var.realm_id
  client_id              = var.client_id
  name                   = var.client_name
  enabled                = true
  access_type            = "CONFIDENTIAL"
  standard_flow_enabled  = true
  service_accounts_enabled = true

  valid_redirect_uris = var.valid_redirect_uris
  web_origins        = var.web_origins
}