#locals {
#  roles = {
#  for x in var.permissions.roles : x => role
#  }
#}
resource "google_service_account" "service_account" {
  account_id   = var.account_id
  display_name = "Service Account"
}
resource "google_project_iam_binding" "project" {
  for_each = var.roles
  project  = var.project
  role     = each.value
  members  = length(split("@", var.members[0])) > 1 ? var.members : [google_service_account.service_account.email]

  condition {
    title       = "expires_after_2019_12_31"
    description = "Expiring at midnight of 2019-12-31"
    expression  = "request.time < timestamp(\"2020-01-01T00:00:00Z\")"
  }
}