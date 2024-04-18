provider "aws" {
  region = var.region
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] 
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.type
  user_data = file("apache.sh")
  associate_public_ip_address = true
  tags = {
    Name = "Ubuntu"
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "my_key"
  public_key = file("~/.ssh/id_rsa.pub")
}

