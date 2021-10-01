resource "aws_instance" "ec2" {
  count                       = var.instance_count
  ami                         = var.ec2_ami
  instance_type               = var.ec2_instance_type

  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.ec2_security_group.id]
  associate_public_ip_address = true

  key_name                    = aws_key_pair.ec2_key_pair.key_name

  tags = {
    Name = var.ec2_name
  }
}

resource "aws_security_group" "ec2_security_group" {
  name        = var.ec2_security_group_name
  description = var.ec2_security_group_description

  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.ec2_security_group_name
  }
}

resource "aws_key_pair" "ec2_key_pair" {
  key_name   = var.ec2_ssh_key_name
  public_key = file(var.ec2_ssh_public_key_path)
}