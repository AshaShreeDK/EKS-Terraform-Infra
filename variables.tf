variable "region" {
  default = "us-east-1"
}

variable "customer" {
  default = "A2A"
}

variable "ec2_ssh_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCz/WgyAQ+qFAqbyfbPDKhAbk4Mdfvcu2nXLhAkD9l6ceYqXv/VISI7pJ9cZ3KzHklydPrxDqZPF96va+WWIS48G2yLht6b+rZcPmcrN56ck9yIrLbt321a4qp9/p/p/xfFfG/D7z5Q42vupSa3MyfxO2JYRqw64U0gQ5mrre5lwXbgTW7dRdqYQpek9ljvY2mFFXzFRbavlFhKbYSQwp7Oe5q/ELHyTIDByYmGFtTPE9OuaZNWrcje/j9y11FDOKsKm8jqnwq1UDz8ZCtbdA/RZk/oFVGU0HHdcj41L82SkXKx8ugGKLzsHanh/wbL4UpWIfAnwJsepGfBDjnVrHur imported-openssh-key"
}

variable "env" {
  default = "dev"
}

variable "vpc_cidr" {
  default = "10.10.0.0/16"
}

variable "public_subnets" {
  type    = list(any)
  default = ["10.10.10.0/24", "10.10.15.0/24"]
}

variable "private_subnets" {
  type    = list(any)
  default = ["10.10.20.0/24", "10.10.25.0/24"]
}

variable "availability_zones" {
  type    = list(any)
  default = ["us-east-1a", "us-east-1b"]
}

variable "keypair" {
  default = "asha.nvrg"
}


variable "cluster_name" {
  default = "A2A-EKS"
}
variable "public_nodes_capacity" {
  default = "ON_DEMAND"
}

variable "public_nodes_type" {
  default = "t2.medium"
}

variable "public_nodes_min" {
  default = 1
}

variable "public_nodes_max" {
  default = 2
}

variable "public_nodes_des" {
  default = 1
}

variable "public_nodes_labels" {
  default = {
    env = "public"
  }
}

variable "private_nodes_capacity" {
  default = "ON_DEMAND"
}

variable "private_nodes_type" {
  default = "t3.small"
}

variable "private_nodes_min" {
  default = 0
}

variable "private_nodes_max" {
  default = 1
}

variable "private_nodes_des" {
  default = 1
}

variable "private_nodes_labels" {
  default = {
    env = "private"
  }
}

