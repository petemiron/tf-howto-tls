output "server_key_private_pem" {
  value = "${tls_private_key.server_key.private_key_pem}"
}

output "server_key_public_pem" {
  value = "${tls_private_key.server_key.public_key_pem}"
}

output "server_cert_pem" {
  value = "${tls_locally_signed_cert.server_cert.cert_pem}"
}

