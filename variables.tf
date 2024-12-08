# variables.tf
variable "project_name" {
  description = "A projekt neve, ami az erőforrások elnevezésében is megjelenik"
  type        = string
  default     = "prf-project"
}

variable "jenkins_port" {
  description = "A Jenkins portja"
  type = number
  default = 8080
}

variable "client_port" {
  description = "Az Angular alkalmazás portja"
  type        = number
  default     = 4200
}

variable "prometheus_port" {
  description = "A Prometheus portja"
  type        = number
  default     = 9090
}

variable "grafana_port" {
  description = "A Grafana portja"
  type        = number
  default     = 3000
}

