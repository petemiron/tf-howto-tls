# Create a key pair for your local CA
resource "tls_private_key" "ca_key" {
  algorithm = "${var.ca_key_algorithm}"
}

# Create a self-signed cert for your local CA
resource "tls_self_signed_cert" "ca_cert" {
  key_algorithm = "${tls_private_key.ca_key.algorithm}"
  private_key_pem = "${tls_private_key.ca_key.private_key_pem}"

  validity_period_hours = "${var.cert_validity_period}"

  subject {
    common_name = "${var.ca_common_name}"
    organization = "${var.ca_organization_name}"
  }
  allowed_uses = [
    "cert_signing",
  ]

  is_ca_certificate = true
}
