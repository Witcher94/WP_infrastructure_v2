variable "bucket" {
  type = string
}
variable "instance-tags" {
  type = list(string)
}
variable "machine-type" {
  type = string
}
variable "source-image" {
  type = string
}
variable "subnetwork" {
  type = string
}
variable "service-account-email" {
  type = string
}
variable "name" {
  type = string
}
variable "startup-script-path" {
  type = string
}
variable "ig-zones" {
  type = list(string)
}
variable "region" {
  type = string
}
variable "named-port-name" {
  type = string
}
variable "named-port-number" {
  type = number
}
variable "interval" {
  type = number
}
variable "timeout" {
  type = number
}
variable "healthy" {
  type = number
}
variable "unhealthy" {
  type = number
}
variable "max-replicas" {
  type=number
}
variable "min-replicas" {
  type = number
}
variable "cooldown-period" {
  type = number
}
variable "target" {
  type = number
}