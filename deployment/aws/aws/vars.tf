resource "random_pet" "test" {
  length = 1
}

locals {
  tags = {
    Name = "Boundary Demo - Aklaas"
    owner = ""
    TTL = 48
  }

  pub_cidrs  = cidrsubnets("10.0.0.0/24", 4, 4, 4, 4)
  priv_cidrs = cidrsubnets("10.0.100.0/24", 4, 4, 4, 4)
}

variable "tag" {
  default = "ak"
}

variable "boundary_bin" {
  default = "~/projects/boundary/bin"
}

variable "pub_ssh_key_path" {
  default = "~/.ssh/id_rsa.pub"
}

variable "num_workers" {
  default = 1
}

variable "num_controllers" {
  default = 1
}

variable "num_targets" {
  default = 1
}

variable "num_subnets_public" {
  default = 2
}

variable "num_subnets_private" {
  default = 2
}

variable "tls_cert_path" {
  default = "/etc/pki/tls/boundary/boundary.cert"
}

variable "tls_key_path" {
  default = "/etc/pki/tls/boundary/boundary.key"
}

variable "tls_disabled" {
  default = true
}

variable "kms_type" {
  default = "aws"
}
