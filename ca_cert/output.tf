output "ca_key_private_pem" {
  value = "${tls_private_key.ca_key.private_key_pem}"
}

output "ca_key_public_pem" {
  value = "${tls_private_key.ca_key.public_key_pem}"
}

output "ca_cert_pem" {
  value = "${tls_self_signed_cert.ca_cert.cert_pem}"
}

