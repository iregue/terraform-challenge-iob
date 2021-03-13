variable "ssh_sg_name" {
  default = "ssh_access"
}

variable "ssh_allowed_ips" {
    default = [
        "139.47.97.91/32",
        "63.33.143.190/32"
    ]
}

variable "ssh_ingress_from_port" {
  default = 22
}

variable "ssh_ingress_to_port" {
  default = 22
}

variable "nginx_sg_name" {
  default = "nginx_access"
}

variable "nginx_ingress_from_port" {
  default = 8080
}

variable "nginx_ingress_to_port" {
  default = 8080
}

variable "alb_sg_name" {
  default = "alb_access"
}

variable "alb_allowed_ips" {
    default = [
        "0.0.0.0/0"
    ]
}

variable "alb_ingress_from_port" {
  default = 80
}

variable "alb_ingress_to_port" {
  default = 80
}
