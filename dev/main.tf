provider "aws" {
  region = "ap-south-1"
  #according to OS give the path of aws credentials i copied in accessible folder to ease of access
  shared_credentials_file = "/var/lib/jenkins/workspace/jenkins-terrraform/cred"
  profile                 = "default"
}
#used vpc module and given cidr as hard coded
module "my_vpc" {

  source                = "../modules/vpc"
  vpc_cidr_block        = "10.0.0.0/16"
  vpc_subnet_cidr_block = "10.0.1.0/24"

  vpc_id                      = module.my_vpc.vpc_id
  vpc_subnet_id               = module.my_vpc.vpc_subnet_id
  vpc_aws_internet_gateway_id = module.my_vpc.vpc_aws_internet_gateway_id
  vpc_route_table_id          = module.my_vpc.vpc_route_table_id

}

module "my_ec2" {

  source                = "../modules/ec2"
  ec2_ami               = "ami-0c1a7f89451184c8b"
  ec2_availability_zone = "ap-south-1a"
  ec2_key_name          = "jenkins"

}

output "ec2_ip" {

  value = module.my_ec2.ec2_public_ip
}
