resource "kubernetes_config_map" "boundary" {
  metadata {
    name = "boundary-config"
  }

  data = {
    "boundary.hcl" = <<EOF
disable_mlock = true

    controller {
      name = "docker-controller"
      description = "A controller for a docker demo!"
      database {
          url = "env://BOUNDARY_PG_URL"
      }
    }

    worker {
      name = "docker-worker"
      description = "A worker for a docker demo"
      address = "0.0.0.0"
      controllers = ["0.0.0.0"]
      #public_addr = "myhost.mycompany.com"
    }

    listener "tcp" {
      address = "0.0.0.0"
      purpose = "api"
      tls_disable = true
    }

    listener "tcp" {
      address = "0.0.0.0"
      purpose = "cluster"
      tls_disable = true
    }

    listener "tcp" {
        address = "0.0.0.0"
        purpose = "proxy"
        tls_disable = true
    }

    kms "aead" {
      purpose = "root"
      aead_type = "aes-gcm"
      key = "sP1fnF5Xz85RrXyELHFeZg9Ad2qt4Z4bgNHVGtD6ung="
      key_id = "global_root"
    }

    kms "aead" {
      purpose = "worker-auth"
      aead_type = "aes-gcm"
      key = "8fZBjCUfN0TzjEGLQldGY4+iE9AkOvCfjh7+p0GtRBQ="
      key_id = "global_worker-auth"
    }

    kms "aead" {
      purpose = "recovery"
      aead_type = "aes-gcm"
      key = "8fZBjCUfN0TzjEGLQldGY4+iE9AkOvCfjh7+p0GtRBQ="
      key_id = "global_recovery"
    }
EOF
  }
}
