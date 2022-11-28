variable "name" {
  type        = string
  description = "The name of the network being created"
}

variable "routing_mode" {
  type        = string
  default     = "GLOBAL"
  description = "The network routing mode (default 'GLOBAL')"
}

variable "description" {
  type        = string
  description = "An optional description of this resource. The resource must be recreated to modify this field."
  default     = ""
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