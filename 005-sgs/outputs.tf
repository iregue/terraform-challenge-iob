output "ssh_securitygroup_output" {
  value = module.ssh_access
}

output "nginx_securitygroup_output" {
  value = module.nginx_access
}

output "alb_securitygroup_output" {
  value = module.alb_access
}