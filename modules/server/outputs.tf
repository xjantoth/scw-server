output "this_scaleway_image_centos_id" {
  value       = data.scaleway_image.centos.id
  description = "Os image ID"
}

output "this_scaleway_instance_server_private_ip" {
  value       = scaleway_instance_server.this.*.private_ip
  description = "Wings Server private IP"
}

output "this_scaleway_instance_server_public_ip" {
  value       = scaleway_instance_server.this.*.public_ip
  description = "Wings Server public IP"
}


