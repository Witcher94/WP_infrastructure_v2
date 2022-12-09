locals {
  username = "pfaka"
  project  = "${local.username}-education-25433"
  region   = "europe-west3"
  zone     = "${local.region}-c"
  ig-zones = ["${local.region}-a", "${local.region}-b", "${local.region}-c"]
}
#Input Variables for VPC module
variable "name" {
  type        = string
  description = "Name for all of the services"
  default     = "wordpress"
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
      name                    = "allow-http"
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
          ports    = ["80"]
        }
      ]
      deny = []
    },
   rule2 = {
      name                    = "allow-iap"
      description             = null
      direction               = "INGRESS"
      priority                = 1000
      ranges                  = ["35.235.240.0/20"]
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
  description = "Coma separated map, to add new rule copy an example above"
}
#Input Variables for service-account module
variable "account_id" {
  type        = string
  description = "Change for other id and display-name for SA, by default in format var.name-service-account"
  default     = ""
}
variable "roles" {
  type        = set(string)
  description = "defined roles"
  default     = ["roles/iap.tunnelResourceAccessor", "roles/compute.instanceAdmin.v1", "roles/iam.serviceAccountUser",
    "roles/storage.admin"]
}
variable "members" {
  type        = list(string)
  description = "Who will achieve the roles"
  default     = [""]
}
#input variables for secret-manager module
variable "length" {
  type        = number
  description = "The secret length"
  default     = 10
}
variable "min_upper" {
  type        = number
  description = "Min number of upper literals"
  default     = 2
}
variable "min_lower" {
  type        = number
  description = "min number of lower literals"
  default     = 2
}
variable "min_numeric" {
  type        = number
  description = "min number of numbers in secret"
  default     = 2
}
variable "min_special" {
  type        = number
  description = "min number of special symbols in secret"
  default     = 2
}
variable "secret_id" {
  type        = string
  description = "id of the secret"
  default     = "wp-secret"
}
variable "labels" {
  type        = string
  description = "Defined labels for the secret"
  default     = "first_secret"
}
#Input Variables for cloud-sql module
variable "db-node-name" {
  type        = string
  description = "Name of each node in mssql cluster"
  default     = "wp-node"
}
variable "db-version" {
  type        = string
  description = "Version of the mssql can be also MYSQL_8_0 or MYSQL_5_6"
  default     = "MYSQL_5_7"
}
variable "deletion_protection" {
  type        = bool
  description = "protection for deletetion databases if set True"
  default     = false
}
variable "tier" {
  type        = string
  description = "Standard DB machine tier "
  default     = "db-n1-standard-2"
}
variable "ipv4_enabled" {
  type        = bool
  description = "If needed external IP set to True"
  default     = false
}
variable "db-name" {
  type        = string
  description = "Database name"
  default     = "wp-database"
}
variable "db-username" {
  type        = string
  description = "Database user"
  default     = "wp-user"
}
#Packer image
variable "image-name" {
  type = string
}
variable "playbook" {
  type = string
}
variable "source-image" {
  type = string
}
variable "account_file" {
  type = string
}
variable "packer-machine-type" {
  type = string
}
variable "wp-playbook" {
  type = string
}
#instance-group
variable "instance-machine-type" {
  type        = string
  description = ""
  default     = "e2-micro"
}
variable "ig-tags" {
  type        = list(string)
  description = ""
  default     = ["wordpress", ]
}
variable "startup-path" {
  type        = string
  description = ""
  default     = "./modules/instance-group/gcloud-startup-script"
}
variable "port-name" {
  type        = string
  description = ""
  default     = "http"
}
variable "port-number" {
  type        = number
  description = ""
  default     = 80
}
variable "interval" {
  type        = number
  description = ""
  default     = 20
}
variable "timeout" {
  type        = number
  description = ""
  default     = 5
}
variable "healthy" {
  type        = number
  description = ""
  default     = 2
}
variable "unhealthy" {
  type        = number
  description = ""
  default     = 5
}
variable "max-replicas" {
  type        = number
  description = ""
  default     = 3
}
variable "min-replicas" {
  type        = number
  description = ""
  default     = 1
}
variable "cooldown-period" {
  type        = number
  description = ""
  default     = 60
}
variable "target" {
  type        = number
  description = ""
  default     = 0.9
}
variable "https-port-range" {
  type = number
  description = ""
  default = 443
}
variable "redirect-port-range" {
  type = number
  description = ""
  default = 80
}
variable "domain" {
  type = string
  description = ""
  default = "pfaka.net"
}
variable "capacity-scaler" {
  type = number
  description = ""
  default = 1.0
}
variable "managed-zone" {
  type = string
  description = ""
  default = "pfaka-net"
}