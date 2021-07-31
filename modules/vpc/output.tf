output "vpc_id"{

    value=aws_vpc.main.id 
}

output "vpc_aws_internet_gateway_id"{

  value=aws_internet_gateway.main.id 
}

output "vpc_subnet_id"{

  value=aws_subnet.main.id 
}

output "vpc_route_table_id"{

  value=aws_route_table.main.id 
}