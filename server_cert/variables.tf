variable "common_name" {
  description = "common name for your Certificate Authority."
  default = "example.com"
}

variable "organization_name" {
  description = "The name of your Certificate Authority's Organization."
  default = "Your Example CA"
}

variable "key_algorithm" {
  description = "The encryption algorithm to use for your private key and cert signing."
  default = "ECDSA"
}

variable "cert_validity_period" {
  description = "Time, in hours, the certificate should be in force for."
  # defaults to roughly 1 month
  default = "730"
}

variable "cert_root_dir" {
  description = "directory to output certificates to."
  default = "../.certs/"
}

variable "ca_key_algorithm" {
  description = "Algorithm used for CA Key"
  default = "ECDSA"
}

variable "ca_private_key_pem_file" {
  description = "CA Private Key pem file."
  default = "../.certs/ca_private_key.pem"
}

variable "ca_cert_pem_file" {
  description = "CA Certificate pem file."
  default = "../.certs/ca_cert.pem"
}

