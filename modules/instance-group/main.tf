data "template_file" "startup_script" {
  template = file("${var.startup-script-path}")
  vars = {
    bucket = var.bucket
    //you can use any variable directly here
  }
}

resource "google_compute_instance_template" "wordpress-template" {
  name           = "${var.name}-image"
  tags           = var.instance-tags
  machine_type   = var.machine-type
  can_ip_forward = false

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  disk {
    source_image = var.source-image
    auto_delete  = true
    boot         = true
  }

  network_interface {
    subnetwork = var.subnetwork
  }

  service_account {
    email  = var.service-account-email
    scopes = ["cloud-platform"]
  }
  metadata_startup_script = file("./modules/instance-group/gcloud-startup-script")
}

resource "google_compute_health_check" "wp-healthcheck" {
  name                = "${var.name}-health-check"
  check_interval_sec  = var.interval
  timeout_sec         = var.timeout
  healthy_threshold   = var.healthy
  unhealthy_threshold = var.unhealthy

  tcp_health_check {
    port = var.named-port-number
  }
}

resource "google_compute_region_instance_group_manager" "wordpress-ig" {
  name                      = "wordpress-ig"
  base_instance_name        = "wordpress"
  region                    = var.region
  distribution_policy_zones = var.ig-zones

  version {
    instance_template = google_compute_instance_template.wordpress-template.id
  }
  named_port {
    name = var.named-port-name
    port = var.named-port-number
  }
  auto_healing_policies {
    health_check      = google_compute_health_check.wp-healthcheck.id
    initial_delay_sec = 300
  }
}
