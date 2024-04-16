variable region {
 type = string
 description = "Provide region"
}

variable vpc_cidr {
 type = list(object({
   cidr_block = string 
   dns_hostnames = bool
   dns_support = bool
 }))
}

variable subnet_cidr {
 type = list(object({
    cidr = string
    subnet_name = string
 }))
}

variable type {
  type  = list(object({
    ami_id = string
    ec2type = string
    instance_name = string
  }))
}

variable ports {
  description = "List of ports to allow traffic"
  type        = list(number)
}
