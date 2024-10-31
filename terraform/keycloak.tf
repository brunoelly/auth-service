terraform {
  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "4.3.1"
    }
  }
}

provider "keycloak" {
  client_id     = "admin-cli"
  username      = "admin"
  password      = "admin"
  url           = "http://keycloak:8080"
}

# Realm
resource "keycloak_realm" "ecommerce" {
  realm             = "ecommerce"
  enabled           = true
  display_name      = "E-Commerce Platform"
  display_name_html = "<strong>E-Commerce Platform</strong>"

  login_theme = "keycloak"
  
  access_token_lifespan = "15m"
  refresh_token_lifespan = "30d"

  ssl_required    = "external"
  password_policy = "upperCase(1) and length(8) and forceExpiredPasswordChange(365) and notUsername"
  
  internationalization {
    supported_locales = [
      "en",
      "pt-BR"
    ]
    default_locale = "en"
  }
}

# Client
resource "keycloak_openid_client" "auth_service_client" {
  realm_id            = keycloak_realm.ecommerce.id
  client_id           = "auth-service"
  name               = "Auth Service"
  enabled            = true
  access_type        = "CONFIDENTIAL"
  standard_flow_enabled = true
  service_accounts_enabled = true

  valid_redirect_uris = [
    "http://localhost:8080/*"
  ]

  web_origins = [
    "+"
  ]
}

# Roles
resource "keycloak_role" "admin" {
  realm_id    = keycloak_realm.ecommerce.id
  name        = "admin"
  description = "Administrator role"
}

resource "keycloak_role" "user" {
  realm_id    = keycloak_realm.ecommerce.id
  name        = "user"
  description = "Regular user role"
}

# Groups
resource "keycloak_group" "admins" {
  realm_id = keycloak_realm.ecommerce.id
  name     = "Administrators"
}

resource "keycloak_group" "users" {
  realm_id = keycloak_realm.ecommerce.id
  name     = "Users"
}

# Group Role Mappings
resource "keycloak_group_roles" "admin_group_roles" {
  realm_id = keycloak_realm.ecommerce.id
  group_id = keycloak_group.admins.id
  role_ids = [
    keycloak_role.admin.id
  ]
}

resource "keycloak_group_roles" "user_group_roles" {
  realm_id = keycloak_realm.ecommerce.id
  group_id = keycloak_group.users.id
  role_ids = [
    keycloak_role.user.id
  ]
}

# Initial Admin User
resource "keycloak_user" "admin_user" {
  realm_id = keycloak_realm.ecommerce.id
  username = "admin@ecommerce.com"
  enabled  = true
  email    = "admin@ecommerce.com"
  
  first_name = "Admin"
  last_name  = "User"
  
  initial_password {
    value     = "admin123"
    temporary = true
  }
}

# Add admin user to admin group
resource "keycloak_user_groups" "admin_user_groups" {
  realm_id = keycloak_realm.ecommerce.id
  user_id  = keycloak_user.admin_user.id
  group_ids = [
    keycloak_group.admins.id
  ]
}