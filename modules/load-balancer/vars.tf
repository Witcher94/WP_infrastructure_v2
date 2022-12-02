variable "name" {
  type = string
}
variable "https-port-range" {
  type = number
}
variable "redirect-port-range" {
  type = number
}
variable "domain" {
  type = string
}
variable "instance-group" {
  type = string
}
variable "health-check" {
  type = string
}
variable "capacity-scaler" {
  type = number

}