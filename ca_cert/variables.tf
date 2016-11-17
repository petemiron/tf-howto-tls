variable "ca_common_name" {
  description = "common name for your Certificate Authority."
  default = "example.com"
}

variable "ca_organization_name" {
  description = "The name of your Certificate Authority's Organization."
  default = "Your Example CA"
}

variable "ca_key_algorithm" {
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