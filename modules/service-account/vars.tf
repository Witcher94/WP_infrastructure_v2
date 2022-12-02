variable "roles" {
  type        = set(string)
  description = "roles"
}
variable "project" {
  type = string
}
variable "account_id" {
  type = string
}
variable "members" {
  type = list(string)
}
variable "name" {
  type = string
}