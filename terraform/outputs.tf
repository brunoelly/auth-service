output "client_secret" {
  value     = keycloak_openid_client.auth_service_client.client_secret
  sensitive = true
}

output "realm_name" {
  value = keycloak_realm.ecommerce.realm
}

output "admin_user_username" {
  value = keycloak_user.admin_user.username
}