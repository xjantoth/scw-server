terraform {
  required_version = "~> 0.12"
}

provider "scaleway" {
  # version         = "~> 2.0"
  access_key      = var.scw_access_key
  secret_key      = var.scw_token
  organization_id = var.scw_organization
  zone            = var.scw_zone
  region          = var.scw_region
}

module "security_group" {
  source = "./modules/security_group"
  sg_name = var.name
}

module "server" {
  source                   = "./modules/server"
  enabled                  = var.enabled
  sg_id                    = module.security_group.this_security_group_id
  instance_type            = var.instance_type
  available_instance_types = var.available_instance_types
  operating_system         = var.operating_system
  server_script_initial    = var.server_script_initial
  tags                     = var.tags
  name                     = var.name
}

