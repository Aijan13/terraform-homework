provider aws {
  region = var.region
}

resource "aws_key_pair" "my_key" {
  key_name   = var.key
  public_key = file("~/.ssh/id_rsa.pub")
}



resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = var.type
  count                  = var.count_number
  vpc_security_group_ids = [aws_security_group.my_sec_group.id]
  availability_zone      = var.availability_zone
  key_name               = var.key
  security_groups        = [aws_security_group.my_sec_group.name]
  associate_public_ip_address = true
  tags = {
    Name = "happy-${count.index + 1}"
  }
}

