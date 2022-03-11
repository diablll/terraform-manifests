#Terraform Block
terraform {
    required_version = "~> 0.14"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0"

        }
    }
}
# Provider Block
provider = "aws" {
    region = var.aws_region
}
resource "aws_instance" "myec2vm" {
    ami = data.aws_ami.ubuntulinux18.id
    #Instance_type = var.instance_type
    #instance_type = var.instance_type_list[1] #For List
    #instance_type = var.instance_type_map["prod"] #For Map
    instance_type = var.instance_type
    key_name = var.instance_keypair
    vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id ]
    #Create EC2 Instance In All Availabilty Zones in a VPC
    for_each = toset(data.aws_availabilty_zones.my_azones.names)
    availabilty_zone = each.key
    #You can also use each.value because for list items each.key == each.value
    count = 1
    tags = {
        "Name" = "Count-Demo-${count.index}"
        "Name" = "For-Each_Demo-${each.key}"
    }
}