#UBUNTU MACHINE

resource "aws_instance" "ubuntu" {
  ami           = var.type[0].ami_id
  instance_type = var.type[0].ec2type
  subnet_id = aws_subnet.public1.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache-ubuntu.sh")
  tags = {
    Name = var.type[0].instance_name
  }
}


#LINUX MACHINE

resource "aws_instance" "amazon" {
  ami           = var.type[1].ami_id
  instance_type = var.type[1].ec2type
  subnet_id = aws_subnet.private2.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache-linux.sh")
  tags = {
    Name = var.type[1].instance_name
  }
}


# output ec2 {
# value = aws_instance.web.public_ip}
# availability_zone = "us-east-2a"

