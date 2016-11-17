# create a null provisioner to save the files
resource "null_resource" "output_server_certs" {
  triggers {
    server_cert_pem = "${tls_locally_signed_cert.server_cert.cert_pem}"
  }

  # create the key dir if it doesn't exist
  provisioner "local-exec" {
    command = "mkdir -p ${var.cert_root_dir}"
  }

  # write the cert request
  provisioner "local-exec" {
    command = "echo '${tls_cert_request.server_cert_req.cert_request_pem}'> ${var.cert_root_dir}server_cert_request.pem"
  }

  # write the cert private key
  provisioner "local-exec" {
    command = "echo '${tls_private_key.server_key.private_key_pem}'> ${var.cert_root_dir}server_private_key.pem"
  }

  # write the server cert pem
  provisioner "local-exec" {
    command = "echo '${tls_locally_signed_cert.server_cert.cert_pem}'> ${var.cert_root_dir}server_cert.pem"
  }
}