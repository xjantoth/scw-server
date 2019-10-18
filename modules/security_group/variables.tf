variable "sg_name" {
  type        = "string"
  description = "Security group name"
}

variable "allowed_ports" {
  description = "List of allowed Firewall Ports"
  type        = "list"
}