variable "bucket-name" {
  type = string
}
variable "region" {
  type = string
}
variable "service-account" {
  type = string
}
variable "prefix" {
  type = string
}
variable "role_entity" {
  type = list(string)
}
variable "storage_class" {}