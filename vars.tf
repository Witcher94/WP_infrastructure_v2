locals {
  project = "pfaka-education-25433"
  region  = "europe-west3"
}
#Input Variables for VPC module
variable "network_name" {
  type        = string
  description = "VPC name related to VPC module"
  default     = "wp-network"
}
variable "description" {
  type        = string
  description = "An optional description of this resource. The resource must be recreated to modify this field. Related to VPC module"
  default     = ""
}
variable "routing_mode" {
  type        = string
  description = "The network routing mode (default 'GLOBAL'), Related to VPC module"
  default     = "GLOBAL"
}
variable "auto_create_subnetworks" {
  type        = bool
  description = "When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources."
  default     = false
}
variable "delete_default_internet_gateway_routes" {
  type        = bool
  description = "If set, ensure that all routes within the network specified whose names begin with 'default-route' and with a next hop of 'default-internet-gateway' are deleted"
  default     = false
}
variable "mtu" {
  type        = number
  description = "The network MTU (If set to 0, meaning MTU is unset - defaults to '1460')."
  default     = 0
}
variable "router_name" {
  type        = string
  description = "Router default name"
  default     = "wp-router"
}
variable "nat_name" {
  type        = string
  description = "Nat default name"
  default     = "wp-nat"
}
variable "allocate_option" {
  type        = string
  description = "nat_ip_allocate_option - How external IPs should be allocated for this NAT."
  default     = "AUTO_ONLY"
}
variable "ip_ranges_to_nat" {
  type        = string
  description = "source_subnetwork_ip_ranges_to_nat - How NAT should be configured per Subnetwork"
  default     = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
#Input Variables for subnet module
variable "subnets" {
  default = {
    private = {
      ip     = "10.10.10.0/24"
      region = "europe-west3"
      name   = "private"
    },
    public = {
      ip                           = "10.10.20.0/24"
      region                       = "europe-west3"
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
#Input Variables for firewall module
variable "rules" {
  default = {
    rule = {
      name                    = "allow-ssh-engress"
      description             = null
      direction               = "INGRESS"
      priority                = 1000
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
#Input Variables for service-account module
variable "account_id" {
  type        = string
  description = ""
  default     = "wp-sa"
}
variable "roles" {
  type        = set(string)
  description = "roles"
  default     = ["roles/iap.tunnelResourceAccessor", "roles/compute.instanceAdmin.v1", "roles/iam.serviceAccountUser"]
}
variable "members" {
  type        = list(string)
  description = ""
  default     = [""]
}
#input variables for secret-manager module
variable "length" {
  type    = number
  default = 10
}
variable "min_upper" {
  type    = number
  default = 2
}
variable "min_lower" {
  type    = number
  default = 2
}
variable "min_numeric" {
  type    = number
  default = 2
}
variable "min_special" {
  type    = number
  default = 2
}
variable "secret_id" {
  type        = string
  description = "wp-secret"
  default     = "wp-secret"
}
variable "labels" {
  type    = string
  default = "first_secret"
}
#Input Variables for cloud-sql module
variable "db-node-name" {
  type        = string
  description = ""
  default     = "wp-node"
}
variable "db-version" {
  type        = string
  description = ""
  default     = "MYSQL_5_7"
}
variable "deletion_protection" {
  type        = bool
  description = ""
  default     = false
}
variable "tier" {
  type        = string
  description = ""
  default     = "db-f1-micro"
}
variable "ipv4_enabled" {
  type        = bool
  description = ""
  default     = false
}
variable "db-name" {
  type        = string
  description = ""
  default     = "wp-database"
}
variable "db-username" {
  type        = string
  description = ""
  default     = "wp-user"
}