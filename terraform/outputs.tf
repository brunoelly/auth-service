output "client_secret" {
  value     = module.client.client_secret
  sensitive = true
}

output "realm_name" {
  value = module.realm.realm_name
}

output "admin_user_username" {
  value = keycloak_user.admin_user.username
}