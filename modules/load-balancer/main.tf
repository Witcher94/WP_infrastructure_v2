resource "google_compute_global_address" "wordpress-front" {
  name = "${var.name}-global-adress"
}

resource "google_compute_global_forwarding_rule" "load-balancer-rule" {
  name       = "${var.name}-forwarding-rule"
  ip_address = google_compute_global_address.wordpress-front.address
  port_range = var.https-port-range
  target     = google_compute_target_https_proxy.httpsProxy.id
}

resource "google_compute_target_https_proxy" "httpsProxy" {
  name             = "${var.name}-proxy"
  url_map          = google_compute_url_map.url-map.id
  ssl_certificates = [google_compute_managed_ssl_certificate.certificate.id]
}
resource "google_compute_managed_ssl_certificate" "certificate" {
  name = "${var.name}-certificate"

  managed {
    domains = ["${var.domain}"]
  }
}
resource "google_compute_url_map" "url-map" {
  name            = "${var.name}url-map"
  default_service = google_compute_backend_service.wordpress-backend.id
}

resource "google_compute_backend_service" "wordpress-backend" {
  backend {
    group           = var.instance-group
    balancing_mode  = "UTILIZATION"
    capacity_scaler = var.capacity-scaler
  }
  name          = "${var.name}-backend"
  health_checks = [var.health-check]
}

#This is a dummy rule for http -> https redirect

resource "google_compute_url_map" "http-redirect" {
  name = "${var.name}-url-map"

  default_url_redirect {
    redirect_response_code = "MOVED_PERMANENTLY_DEFAULT" // 301 redirect
    strip_query            = false
    https_redirect         = true // this is the magic
  }
}

resource "google_compute_target_http_proxy" "http-redirect" {
  name    = "${var.name}-proxy"
  url_map = google_compute_url_map.http-redirect.self_link
}

resource "google_compute_global_forwarding_rule" "http-redirect" {
  name       = "${var.name}-redirect-forwarding-rule"
  target     = google_compute_target_http_proxy.http-redirect.self_link
  ip_address = google_compute_global_address.wordpress-front.address
  port_range = var.redirect-port-range
}