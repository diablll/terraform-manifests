# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.12.0"
  # insert the 23 required variables here
   name = "vpc-dev"
  cidr = "10.0.0.0/16"
   azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]
  #Dataase Subnet
  create_database_subnet_group = true 
  create_database_subnet_route_table = true
  #create_database_nat_gateway_route = true
  #create_database_internet_gateway_route = true
  database_subnets = ["10.0.151.0/24", "10.0.152.0/24"]
  #NAT Gateways -Outbound Communication
  enable_nat-gateway = true
  single_nat-gateway = true
#VPC DNS Parameters
enable_dns_hostnames = true
enable_dns_support = true

public_subnet_tags = {
    Type = "public-subnets"
}
private_subnet_tags = {
    Type = "private-subnets"
}
database_subnet_tags = {
    Type = "database-subnets"
}
tags = {
    Owner = "Bajo"
    Environment = "dev"
}
vpc_tags = {
    Name = "vpc-dev"
}
}