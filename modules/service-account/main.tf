resource "google_service_account" "service_account" {
  account_id   = var.account_id
  display_name = "Service Account"
}
resource "google_project_iam_binding" "project" {
  for_each = var.roles
  project  = var.project
  role     = each.value
  members  = length(split("@", var.members[0])) > 1 ? var.members : ["serviceAccount:${google_service_account.service_account.email}", ]
}