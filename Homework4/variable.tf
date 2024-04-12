variable ami_id {
  description = "Provide ami id"
  default = ""
  type = string
}

variable type  {
  description = "Provide instance type"
  default = ""
  type = string
}

variable region {
  description = "Provide region"
  default = ""
  type = string
}

variable availability_zone {
  description = "Provide availability zone"
  default = ""
  type    = string

}


variable ports {
  description = "Provide ports"
  default = [22, 80, 443]
  type = list(number)
}

variable key {
  description = "Provide key name"
  default = "bastion-key"
  type = string
}

variable count_number {
  description = "Provide count number"
  default = "1"
  type = string
}
