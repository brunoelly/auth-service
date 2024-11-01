resource "keycloak_realm" "realm" {
  realm             = var.realm_name
  enabled           = true
  display_name      = var.display_name
  display_name_html = "<strong>${var.display_name}</strong>"

  login_theme = "keycloak"
  
  access_token_lifespan = var.access_token_lifespan
  refresh_token_lifespan = var.refresh_token_lifespan

  ssl_required    = "external"
  password_policy = var.password_policy
  
  internationalization {
    supported_locales = var.supported_locales
    default_locale    = var.default_locale
  }
}