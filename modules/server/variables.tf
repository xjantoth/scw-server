variable "instance_type" {
  type        = string
  description = "Desired development instance type"
}

variable "available_instance_types" {
  type        = map(string)
  description = "Available types for development Scaleway instances"
}

variable "operating_system" {
  type        = string
  description = "Operating system to be used"
}

variable "sg_id" {
  type        = string
  description = "Security group id"
}

variable "server_script_initial" {
  type        = "string"
  description = "Shell script to initiate Wings server"
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
