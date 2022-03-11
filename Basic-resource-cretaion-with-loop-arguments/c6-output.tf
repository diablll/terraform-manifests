#Teraform Output values
#EC2 Instance Public IP
output "instance_publicip" {
    description = "EC2 Instance Public IP"
    value = aws_instance.myec2vm.public_ip
}
#EC2 Instance Public DNS
output "instance_publicdns" {
    description = "EC2 Instance Public DNS"
    value = aws_instance.myec2vm.instance_public_dns
}
output "output_v1_1" {
    value = data.aws_ec2_instance_type_offerings.my_ins_type1.instance_types
}
