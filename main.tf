resource "cosmic_network_acl" "default" {
  name   = var.name
  vpc_id = var.vpc_id
}

resource "cosmic_network_acl_rule" "default" {
  acl_id = cosmic_network_acl.default.id

  dynamic "rule" {
    for_each = var.services

    content {
      action       = "allow"
      cidr_list    = rule.value["allowed_cidrs"]
      protocol     = rule.value["protocol"]
      ports        = list(rule.value["public_port"])
      traffic_type = "ingress"
    }
  }
}

resource "cosmic_ipaddress" "default" {
  acl_id = cosmic_network_acl.default.id
  vpc_id = var.vpc_id
}

resource "cosmic_loadbalancer_rule" "default" {
  for_each      = var.services
  name          = each.key
  algorithm     = "roundrobin"
  ip_address_id = cosmic_ipaddress.default.id
  network_id    = var.network_id
  public_port   = each.value.public_port
  private_port  = each.value.private_port
  member_ids    = each.value.member_ids
}
