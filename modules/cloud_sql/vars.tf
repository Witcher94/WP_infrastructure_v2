variable "vpc-network" {
  type        = any
  description = "VPC-Network output"
}
variable "db-node-name" {
  type        = string
  description = ""
}
variable "db-version" {
  type        = string
  description = ""
}
variable "region" {
  type        = string
  description = ""
}
variable "deletion_protection" {
  type        = bool
  description = ""
  default     = true
}
variable "tier" {
  type        = string
  description = ""
}
variable "ipv4_enabled" {
  type        = bool
  description = ""
  default     = false
}
variable "db-name" {
  type        = string
  description = ""
}
variable "db-username" {
  type        = string
  description = ""
}
variable "db-password" {

}
