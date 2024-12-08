# modules/grafana/docker/main.tf
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

resource "docker_image" "grafana" {
  name = "grafana-prf:latest"
  build {
    context    = "."
    dockerfile = "Dockerfile_grafana"
    tag        = ["grafana-prf:latest"]
    no_cache   = true
  }
}

resource "docker_container" "grafana" {
  name  = "${var.container_name}"
  hostname = "${var.container_name}"
  image = docker_image.grafana.image_id

#  volumes {
#    container_path = "/var/lib/grafana"
#    volume_name = "grafana-vol-test"
#  }

  # Port mapping
  ports {
    internal = var.app_port
    external = var.app_port
  }

  # Hálózat csatlakozás
  networks_advanced {
    name = "${var.project_name}-network"
    ipv4_address = "172.100.0.80"
  }
}

# Output a container_name használatához
output "container_name" {
  value = var.container_name
}
