variable "alb_name" {
  default = "nginx-alb"
}

variable "alb_type" {
  default = "application"
}

variable "target_type" {
  default = "instance"
}

variable "nginx_tg_protocol" {
  default = "HTTP"
}

variable "nginx_tg_port" {
  default = 8080
}

variable "nginx_tg_name" {
  default = "nginx-tg"
}

variable "nginx_listener_port" {
  default = 80
}

variable "nginx_listener_protocol" {
  default = "HTTP"
}

variable "vpc_id" {
  default = "vpc-edfc678b"
}

variable "subnet1" {
  default = "subnet-f81daab0"
}

variable "subnet2" {
  default = "subnet-09e49853fdd899259"
}
