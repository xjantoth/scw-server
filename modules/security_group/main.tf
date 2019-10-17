resource "scaleway_instance_security_group" "this" {
  inbound_default_policy = "accept"
  name                   = "sg-${var.sg_name}"
  description            = "Security group for Wings node."

  inbound_rule {
    action   = "accept"
    ip_range = "0.0.0.0/0"
    protocol = "TCP"
    port     = 22
  }

  inbound_rule {
    action   = "accept"
    ip_range = "0.0.0.0/0"
    protocol = "TCP"
    port     = 80
  }

  inbound_rule {
    action   = "accept"
    ip_range = "0.0.0.0/0"
    protocol = "TCP"
    port     = 443
  }
}


