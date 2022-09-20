variable "network" {
  description = "Network value from the VPC module, append .id, etc to use in other resources"
}
variable "subnets" {
  type = map(map(string))
  description = "The list of subnets being created"
}

