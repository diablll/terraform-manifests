#AWS EC2 Security Group Terraform Module
#Security Group for Public Bastion Host
module "security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.8.0"
  # insert the 3 required variables here

  name = "private-sg"
  description = "Security Group with HTTP & SSH port open for everybody (IPV4 CIDR). egress ports are all world open"
  vpc_id = module.vpc.vpc_id
  
  #Ingress Rules & CIDR Blocks
  ingress_rules = ["ssh-tcp", "http-80-tcp"]
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]

  #Egress Rule - all-all open
  egress_rules = ["all-all"]
  tags = local.common_tags
}