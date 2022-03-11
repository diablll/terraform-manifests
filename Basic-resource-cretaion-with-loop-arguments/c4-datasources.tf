data "aws_ami" "ubuntulinux18" {
  most_recent      = true
  owners           = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
      name = "architecture"
      values = ["x86_64"]
  }
}
data "aws_availabilty_zones" "my_azones" {
    filter {
        name = "opt-in-status"
        values = ["opt-in-not-required"]
    }
}
data "aws_ec2_instance_type_offerings" "my_ins_type1" {
    filter {
        name = "instance-type"
        values = ["t3.micro"]
    }
    filter {
        name = "location"
        values ["us-west-1"]
    }
    location_type = "availabilty-zone"
}
data "aws_ec2_instance_type_offerings" "my_ins_type2" {
    for_each = toset([ "us-east-1a", "us-east-1b", "us-east-1e"])
    filter {
        name = "instance-type"
        values = ["t3.micro"]
    }
    filter {
        name = "location"
        values = [each.key]
    }
    location_type = "availability-zone"
}
data "aws_ec2_instance_type_offerings" "my_ins_type" {
    for_each = toset(data.aws_availabilty_zones.my_azones.names)
    filter {
        name = "instance-type"
        values = ["t3.micro"]
    }
    filter {
        name = "location"
        values = [each.key]
    }
    location_type = "availability-zone"