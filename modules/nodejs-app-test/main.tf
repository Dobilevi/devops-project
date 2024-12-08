# modules/nodejs-app-test/docker/main.tf
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

resource "docker_image" "node_app_test" {
  name = "nodejs-test-prf:latest"
  build {
    context    = "."
    dockerfile = "Dockerfile_server-deploy-env"
    tag        = ["nodejs-test-prf:latest"]
    no_cache   = true
  }
}

resource "docker_container" "node_app_test" {
  name  = "${var.container_name}"
  hostname = "${var.container_name}"
  image = docker_image.node_app_test.image_id

  # Hálózat csatlakozás
  networks_advanced {
    name = "${var.project_name}-network"
    ipv4_address = "172.100.0.15"
  }
}

# Output a container_name használatához
output "container_name" {
  value = var.container_name
}
