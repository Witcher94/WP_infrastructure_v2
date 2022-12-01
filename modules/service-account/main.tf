resource "google_service_account" "service_account" {
  account_id   = var.account_id
  display_name = var.account_id
}
resource "google_project_iam_binding" "project" {
  for_each = var.roles
  project  = var.project
  role     = each.value
  members  = length(split("@", var.members[0])) > 1 ? var.members : ["serviceAccount:${google_service_account.service_account.email}", ]
}
resource "google_service_account_key" "my_key" {
  service_account_id = google_service_account.service_account.name
  private_key_type   = "TYPE_GOOGLE_CREDENTIALS_FILE"
}
