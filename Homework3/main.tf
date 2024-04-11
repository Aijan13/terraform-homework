provider "aws" {
  region = "us-east-2"
}

data "aws_ami" "amazon-linux-2" {
 most_recent = true

 filter {
   name   = "owner-alias"
   values = ["amazon"]
 }

 filter {
   name   = "name"
   values = ["amzn2-ami-hvm*"]
 }
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_instance" "web" {

  for_each = {
    "web-1" = "us-east-2a",
    "web-2" = "us-east-2b", 
    "web-3" = "us-east-2c"}

 tags = {
    Name = "${each.key}"
  }
  ami = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  key_name = aws_key_pair.deployer.key_name
  associate_public_ip_address = true
  user_data = file("apache.sh")
  user_data_replace_on_change = true
  availability_zone = each.value

} 
#output {
#   value = aws_instance.web[*].public_ip}
# variable "availability_zones" {
#   description = "Availability zones"
#   type        = list(string)
#   default     = ["us-east-2a", "us-east-2b", "us-east-2c"]
# }






