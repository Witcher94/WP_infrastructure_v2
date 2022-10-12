locals {
  region = "europe-west3"
}

variable "subnets" {
  default = {
    private = {
      ip     = "10.10.10.0/24"
      region = "europe-west-3"
      name   = "private"
    },
    public = {
      ip                           = "10.10.20.0/24"
      region                       = "europe-west-3"
      name                         = "public"
      subnet_flow_logs             = "true"
      subnet_flow_logs_interval    = "INTERVAL_10_MIN"
      subnet_flow_logs_sampling    = 0.7
      subnet_flow_logs_metadata    = "INCLUDE_ALL_METADATA"
      subnet_flow_logs_filter_expr = "true"
    }
  }
  description = ""
}
variable "rules" {
  default = {
    rule = {
      name                    = "allow-ssh-engress"
      description             = null
      direction               = "INGRESS"
      priority                = 1
      ranges                  = ["0.0.0.0/0"]
      source_tags             = null
      source_service_accounts = null
      target_tags             = null
      target_service_accounts = null
      allow = [
        {
          protocol = "tcp"
          ports    = ["22"]
        }
      ]
      deny = []
    }
  }
  description = ""
}