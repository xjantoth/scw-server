# server outputs
output "server_scaleway_image_centos_id" {
  value       = module.server.this_scaleway_image_centos_id
  description = "Os image ID"
}

output "server_scaleway_instance_server_private_ip" {
  value       = module.server.this_scaleway_instance_server_private_ip
  description = "Kubernetes server private ip"
}

output "server_scaleway_instance_server_public_ip" {
  value       = module.server.this_scaleway_instance_server_public_ip
  description = "Kubernetes server public ip"
}



