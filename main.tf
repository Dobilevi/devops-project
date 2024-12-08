# main.tf
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

# Közös hálózat létrehozása
resource "docker_network" "app_network" {
  name = "${var.project_name}-network"
  driver = "bridge"
  # Enable IPv6 if needed
  ipam_config {
    subnet = "172.100.0.0/16"  # Customize subnet as needed
    gateway = "172.100.0.1"
  }
  internal = false
}

# Jenkins modul
module "jenkins" {
  source = "./modules/jenkins"

  app_port = var.jenkins_port
  container_name = "${var.project_name}-jenkins"
}

# MongoDB modul
module "mongodb" {
  source = "./modules/mongodb"

  container_name = "${var.project_name}-mongodb"
}

# MongoDB teszt modul
module "mongodb_test" {
  source = "./modules/mongodb-test"

  container_name = "${var.project_name}-mongodb-test"
}

# NodeJS alkalmazás modul
module "nodejs_app" {
  source = "./modules/nodejs-app"

  container_name = "${var.project_name}-nodejs"
}

# NodeJS teszt alkalmazás modul
module "nodejs_app_test" {
  source = "./modules/nodejs-app-test"

  container_name = "${var.project_name}-nodejs-test"
}

# Angular alkalmazás modul
module "angular_app" {
  source = "./modules/angular-app"
  
  app_port = var.client_port
  container_name = "${var.project_name}-angular"
}

# Angular teszt alkalmazás modul
module "angular_app_test" {
  source = "./modules/angular-app-test"
  
  app_port = var.client_port
  container_name = "${var.project_name}-angular-test"
}

# Nginx modul
module "nginx" {
  source = "./modules/nginx"
}

# Prometheus modul
module "prometheus" {
    source = "./modules/prometheus"
  
  app_port = var.prometheus_port
  container_name = "${var.project_name}-prometheus"
}

# Grafana modul
module "grafana" {
    source = "./modules/grafana"
  
  app_port = var.grafana_port
  container_name = "${var.project_name}-grafana"
}

output "network_info" {
  value = {
    network_id   = docker_network.app_network.id
    network_name = docker_network.app_network.name
  }
}
