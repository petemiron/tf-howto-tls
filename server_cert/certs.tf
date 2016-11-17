## This example create a self-signed certificate for a development
## environment.

## THIS IS NOT RECOMMENDED FOR PRODUCTION SERVICES.
## See the detailed documentation of each resource for further
## security considerations and other practical tradeoffs.


# Create a key pair for your server
resource "tls_private_key" "server_key" {
  algorithm = "${var.key_algorithm}"
}



# Create a cert request for you server
resource "tls_cert_request" "server_cert_req" {
  key_algorithm = "${tls_private_key.server_key.algorithm}"
  private_key_pem = "${tls_private_key.server_key.private_key_pem}"

  subject {
    common_name = "${var.common_name}"
    organization = "${var.organization_name}"
  }
}

# Create the locally signed cert
resource "tls_locally_signed_cert" "server_cert" {
  cert_request_pem = "${tls_cert_request.server_cert_req.cert_request_pem}"

  ca_key_algorithm = "${var.ca_key_algorithm}"
  ca_private_key_pem = "${file(var.ca_private_key_pem_file)}"
  ca_cert_pem = "${file(var.ca_cert_pem_file)}"

  # set valid for 1 week.
  validity_period_hours = 168

  allowed_uses = [
    "server_auth",
  ]
}


