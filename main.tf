terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.0"
    }
  }
}

provider "local" {}

resource "local_file" "example" {
  filename = "${path.module}/hello.txt"
  content  = "Hello, Terraform!"
}
provider "docker" {}

resource "docker_container" "nginx" {
  image = "nginx"
  name  = "example_nginx"
}

