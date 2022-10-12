resource "google_compute_firewall" "rules" {
  for_each                = var.rules
  name                    = each.value.name
  description             = lookup(each.value, "description", null)
  direction               = each.value.direction
  network                 = var.network.name
  source_ranges           = each.value.direction == "INGRESS" ? each.value.ranges : null
  destination_ranges      = each.value.direction == "EGRESS" ? each.value.ranges : null
  source_tags             = lookup(each.value, "source_tags", null)
  source_service_accounts = lookup(each.value, "source_service_accounts ", null)
  target_tags             = lookup(each.value, "target_tags ", null)
  target_service_accounts = lookup(each.value, "target_service_accounts", null)
  priority                = lookup(each.value, "priority", null)

  dynamic "allow" {
    for_each = lookup(each.value, "allow", [])
    content {
      protocol = allow.value.protocol
      ports    = lookup(allow.value, "ports", null)
    }
  }

  dynamic "deny" {
    for_each = lookup(each.value, "deny", [])
    content {
      protocol = deny.value.protocol
      ports    = lookup(deny.value, "ports", null)
    }
  }
}