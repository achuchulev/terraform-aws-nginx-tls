// Create security group to allow Nomad traffic
resource "aws_security_group" "nginx" {
  name        = "atanas-nginx-sg"
  description = "Ingress for nginx"
  vpc_id      = var.vpc_id

  // Custom ICMP Rule - IPv4 Echo Reply
  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Custom ICMP Rule - IPv4 Echo Request
  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allowed_nginx_traffic"
  }
}

// Creates AWS EC2 instances for nginx server
resource "aws_instance" "nginx" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.nginx.id]

  tags = {
    Name       = "nginx-tls"
  }

  user_data = templatefile("${path.root}/templates/nginx-config.tpl", { fqdn = var.fqdn })
}
