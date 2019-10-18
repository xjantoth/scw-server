resource "scaleway_instance_security_group" "this" {
  inbound_default_policy  = "drop"
  outbound_default_policy = "accept"

  # inbound_default_policy = "accept"

  name        = "sg-${var.sg_name}"
  description = "Security group for Wings node."


  dynamic "inbound_rule" {
    for_each = var.allowed_ports

    content {
      action   = "accept"
      port     = inbound_rule.value
      protocol = "TCP"
      ip_range = "0.0.0.0/0"
    }
  }
}


