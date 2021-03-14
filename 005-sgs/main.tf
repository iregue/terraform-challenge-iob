module "ssh_access" {
  source             = "git@github.com:iregue/terraform-aws-sg.git"
  securitygroup_name = var.ssh_sg_name
  allowed_ips        = var.ssh_allowed_ips
  ingress_from_port  = var.ssh_ingress_from_port
  ingress_to_port    = var.ssh_ingress_to_port
}

module "alb_access" {
  source             = "git@github.com:iregue/terraform-aws-sg.git"
  securitygroup_name = var.alb_sg_name
  allowed_ips        = var.alb_allowed_ips
  ingress_from_port  = var.alb_ingress_from_port
  ingress_to_port    = var.alb_ingress_to_port
}

module "nginx_access" {
  #module "nginx_access" {
  source             = "git@github.com:iregue/terraform-aws-sg.git"
  securitygroup_name = var.nginx_sg_name
  ingress_from_port  = var.nginx_ingress_from_port
  ingress_to_port    = var.nginx_ingress_to_port
  allowed_sgs        = [module.alb_access.sg_id]

}