variable "boundary_bin" {
  default = "~/projects/boundary/bin"
}

variable "pub_ssh_key_path" {
  default = "~/.ssh/id_rsa.pub"
}


output "boundary_lb" {
  value = module.aws.boundary_lb
}

output "target_ips" {
  value = module.aws.target_ips
}

output "worker_ips" {
 value = module.aws.worker_ips
}

output "controller_ips" {
  value = module.aws.controller_ips
}


