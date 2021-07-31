variable "vpc_cidr_block" {

  type = string
  description="Vpc cidr block"
}

variable "vpc_subnet_cidr_block" {

  type = string
  description="Subnet cidr block should be in range of vpc cidr"
}

variable "vpc_id"{

  type=string
  description="Id of the vpc"
}
variable "vpc_aws_internet_gateway_id"{

  type=string 
  description="Internet Gateway Id"
}

variable "vpc_subnet_id"{

  type=string 
  description="Subnet Id"
}

variable "vpc_route_table_id"{

  type=string 
  description="Route Table Id"
}