output "nginx_instance_private_ip" {
  value = aws_instance.nginx.private_ip
}

output "nginx_instance_public_ip" {
  value = aws_instance.nginx.public_ip
}
