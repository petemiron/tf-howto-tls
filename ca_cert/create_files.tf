# create a null provisioner to save the files
resource "null_resource" "output_ca_certs" {
  triggers {
    ca_cert_pem = "${tls_self_signed_cert.ca_cert.cert_pem}"
  }

  # create the key dir if it doesn't exist
  provisioner "local-exec" {
    command = "mkdir -p ${var.cert_root_dir}"
  }

  # write the private key
  provisioner "local-exec" {
    command = "echo '${tls_private_key.ca_key.private_key_pem}'> ${var.cert_root_dir}ca_private_key.pem"
  }

  # write the public key pem
  provisioner "local-exec" {
    command = "echo '${tls_private_key.ca_key.public_key_pem}'> ${var.cert_root_dir}ca_public_key.pem"
  }

  # write the cert to a pem file
  provisioner "local-exec" {
    command = "echo '${tls_self_signed_cert.ca_cert.cert_pem}'> ${var.cert_root_dir}ca_cert.pem"
  }
}