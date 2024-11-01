module "realm" {
  source = "./modules/realm"
}

module "client" {
  source   = "./modules/client"
  realm_id = module.realm.realm_id
}

module "roles" {
  source   = "./modules/roles"
  realm_id = module.realm.realm_id
}

# Groups
resource "keycloak_group" "admins" {
  realm_id = module.realm.realm_id
  name     = "Administrators"
}

resource "keycloak_group" "users" {
  realm_id = module.realm.realm_id
  name     = "Users"
}

# Group Role Mappings
resource "keycloak_group_roles" "admin_group_roles" {
  realm_id = module.realm.realm_id
  group_id = keycloak_group.admins.id
  role_ids = [module.roles.admin_role_id]
}

resource "keycloak_group_roles" "user_group_roles" {
  realm_id = module.realm.realm_id
  group_id = keycloak_group.users.id
  role_ids = [module.roles.user_role_id]
}

# Initial Admin User
resource "keycloak_user" "admin_user" {
  realm_id   = module.realm.realm_id
  username   = "admin@ecommerce.com"
  enabled    = true
  email      = "admin@ecommerce.com"
  first_name = "Admin"
  last_name  = "User"
  
  initial_password {
    value     = "admin123"
    temporary = true
  }
}

resource "keycloak_user_groups" "admin_user_groups" {
  realm_id  = module.realm.realm_id
  user_id   = keycloak_user.admin_user.id
  group_ids = [keycloak_group.admins.id]
}