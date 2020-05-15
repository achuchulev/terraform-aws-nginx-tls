output "nginx_instance_private_ip" {
  value = aws_instance.nginx.private_ip
}
