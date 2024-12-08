# modules/prometheus/docker/main.tf
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

resource "docker_image" "prometheus" {
  name = "prometheus-prf:latest"
  build {
    context    = "."
    dockerfile = "Dockerfile_prometheus"
    tag        = ["prometheus-prf:latest"]
    no_cache   = true
  }
}

resource "docker_container" "prometheus" {
  name  = "${var.container_name}"
  hostname = "${var.container_name}"
  image = docker_image.prometheus.image_id

  volumes {
    container_path = "/prometheus"
    volume_name = "prometheus-vol"
  }

  # Port mapping
  ports {
    internal = var.app_port
    external = var.app_port
  }

  # Hálózat csatlakozás
  networks_advanced {
    name = "${var.project_name}-network"
    ipv4_address = "172.100.0.70"
  }
}

# Output a container_name használatához
output "container_name" {
  value = var.container_name
}
