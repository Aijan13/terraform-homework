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
