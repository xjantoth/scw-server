variable "scw_organization" {
  type        = string
  description = "Scaleway Organization"
}

variable "scw_token" {
  type        = string
  description = "Scaleway Token"
}

variable "scw_access_key" {
  type        = "string"
  description = "Scaleway Region Access Key"
}

variable "scw_region" {
  type        = string
  description = "Scaleway Region"
}

variable "scw_zone" {
  type        = string
  description = "Scaleway Region"
}

variable "instance_type" {
  type        = string
  description = "Desired development instance type"
}

variable "available_instance_types" {
  type = map(string)
  default = {
    DEV1-S = "x86_64"
    DEV1-M = "x86_64"
    DEV1-L = "x86_64"

  }
  description = "Available types for development Scaleway instances"
}

variable "operating_system" {
  type        = string
  description = "Operating system to be used"
}

variable "server_script_initial" {
  type        = "string"
  description = "Shell script to initiate Kubernetes master"
}

variable "name" {
  type        = "string"
  description = "Server name for Wings server"
}

variable "tags" {
  type        = "list"
  description = "Tags for Wings server"
}

variable "enabled" {
  description = "Flag to enable or disable the sending of emails"
  type        = "string"
}

variable "allowed_ports" {
  description = "List of allowed Firewall Ports"
  type        = "list"
}

