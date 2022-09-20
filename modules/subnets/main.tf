resource "google_compute_subnetwork" "subs" {
  for_each                 = var.subnets
  ip_cidr_range            = each.value.ip
  name                     = each.value.name
  private_ip_google_access = lookup(each.value, "subnet_private_access", "false")
  dynamic "log_config" {
    for_each = lookup(each.value, "subnet_flow_logs", false) ? [
      {
        aggregation_interval = lookup(each.value, "subnet_flow_logs_interval", "INTERVAL_5_SEC")
        flow_sampling        = lookup(each.value, "subnet_flow_logs_sampling", "0.5")
        metadata             = lookup(each.value, "subnet_flow_logs_metadata", "INCLUDE_ALL_METADATA")
        filter_expr          = lookup(each.value, "subnet_flow_logs_filter", "true")
      }
    ] : []
    content {
      aggregation_interval = log_config.value.aggregation_interval
      flow_sampling        = log_config.value.flow_samplinggit
      metadata             = log_config.value.metadata
      filter_expr          = log_config.value.filter_expr
    }
  }
  region  = each.value.region
  network = var.network.id
}