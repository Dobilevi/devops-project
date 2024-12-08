# modules/jenkins/docker/main.tf
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

resource "docker_image" "jenkins" {
  name = "jenkins-prf:latest"
  build {
    context    = "."
    dockerfile = "Dockerfile_jenkins"
    tag        = ["jenkins-prf:latest"]
    no_cache   = true
  }
}

resource "docker_container" "jenkins" {
  name  = "${var.container_name}"
  hostname = "${var.container_name}"
  image = docker_image.jenkins.image_id

#  volumes {
#    container_path = "/var/jenkins_home"
#    volume_name = "jenkins-vol"
#  }

  # Port mapping
  ports {
    internal = var.app_port
    external = var.app_port
  }
  
  # Hálózat csatlakozás
  networks_advanced {
    name = "${var.project_name}-network"
    ipv4_address = "172.100.0.60"
  }
}

# Output a container_name használatához
output "container_name" {
  value = var.container_name
}
