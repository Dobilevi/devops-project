# modules/angular-app-test/docker/main.tf
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

resource "docker_image" "angular_app_test" {
  name = "angular-test-prf:latest"
  build {
    context    = "."
    dockerfile = "Dockerfile_client-deploy-env"
    tag        = ["angular-test-prf:latest"]
    no_cache   = true
  }
}

resource "docker_container" "angular_app_test" {
  name  = "${var.container_name}"
  hostname = "${var.container_name}"
  image = docker_image.angular_app_test.image_id
  
  # Port mapping
  ports {
    internal = var.app_port
    external = var.app_port + 1
  }
  
  # Hálózat csatlakozás
  networks_advanced {
    name = "${var.project_name}-network"
    ipv4_address = "172.100.0.25"
  }
}
