provider aws {
  region = var.region
}

resource "aws_key_pair" "my_key" {
  key_name   = var.key
  public_key = file("~/.ssh/id_rsa.pub")
}


resource aws_security_group "my_sec_group" {
  name = "allow"
  description = "Allow TLS inbound traffic"

  ingress {
    description      = "provide port 22"
    from_port        = var.ports[0]
    to_port          = var.ports[0]
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
 ingress {
    description      = "provide port 80"
    from_port        = var.ports[1]
    to_port          = var.ports[1]
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

 ingress {
    description      = "provide port 443"
    from_port        = var.ports[2]
    to_port          = var.ports[2]
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

 egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
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

