provider "aws" {
  region = "ap-south-1"
  shared_credentials_file = "C:/Users/Administrator/.aws/credentials"
  profile = "default"
}
module "my_vpc" {

  source                      = "../modules/vpc"
  vpc_cidr_block              = "${var.vpc_cidr_block}"
  vpc_subnet_cidr_block       = "${var.vpc_subnet_cidr_block}"
  vpc_id                      = "${module.my_vpc.vpc_id}"
  vpc_subnet_id               = "${module.my_vpc.vpc_subnet_id}"
  vpc_aws_internet_gateway_id = "${module.my_vpc.vpc_aws_internet_gateway_id}"
  vpc_route_table_id          = "${module.my_vpc.vpc_route_table_id}"

}

module "my_ec2" {

  source                = "../modules/ec2"
  ec2_ami               = "${var.ec2_ami}"
  ec2_availability_zone = "${var.ec2_availability_zone}"
  ec2_key_name          = "${var.ec2_key_name}"

}
