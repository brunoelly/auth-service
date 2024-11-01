terraform {
  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "4.3.1"
    }
  }
}

provider "keycloak" {
  client_id = var.keycloak_admin_username
  username  = var.keycloak_admin_username
  password  = var.keycloak_admin_password
  url       = var.keycloak_url
}