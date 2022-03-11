#Output - For Loop with List
output "for_output_list" {
    description = "for Loop With List"
    value = [ for instance in aws_instance.myec2vm: instance.public_dns]
}
#Output - For Loop With Map Advanced
#c = count
output "for_output_map2" {
    description = "For loop with Map - Advanced"
    value = { for c, instance in aws_instance.myec2vm: c => instance.public_dns}
}
#Output Legacy Splat Operator (Legacy) - Returns The List
output "legacy_splat_instance_publicdns" {
    description = "Legacy Splat Operator"
    value = aws_instance.myec2vm.*.public_dns
}
#Output Latest Generalized Splat Operator - Returns The List
output "latest_splat_instance_publicdns" {
    description = "Generalized latest Splat Operator"
    value = aws_instance.myec2vm[*].public_dns
}
#Output Instance Public DNS with TOSET
output "instance_publicdns" {
    description = "EC2 Instance Public DNS"
    #value = aws_instance.myec2vm[*].public_dns #Legacy Splat
    #value = aws_instance.myec2vm[*].public_dns #Latest Splat
    value = toset([ for instance in aws_instance.myec2vm: instance.public_dns])
}
#Output Instance Public IP with TOSET
output "instance_publicip" {
    description = "EC2 Instance Public IP"
    #value = aws_instance.myec2vm[*].public_ip #Legacy Splat
    #value = aws_instance.myec2vm[*].public_ip #Latest Splat
    value = toset([ for instance in aws_instance.myec2vm: instance.public_ip])
}
#EC2 Instance Public DNS With TOMAP
output "instance_publicdns2" {
    value = { for az, instance in aws_instance.myec2vm: az => instance.public_dns}
}
output "output_v1_1" {
    value = data.aws_ec2_instance_type_offerings.my_ins_type2.instance_types
}
#Important Note: Once for_each is set, its attributes must be accessed on specific instances
output "output_v2_1" {
    value = toset([for t in data.aws_ec2_instance_type_offerings.my_ins_type2: t.instance_types])
}
#Create a Map with Key as Availability Zone and value as Instance Type Supported
ouput "output_v2_2" {
    value = {
        for az, details in data.aws_ec2_instance_type_offerings.my_ins_type2: az => details.instance_types
    }
}
#Basic Output: All Availabilty Zones mapped to Supported Instance Types
output "output_v3_1" {
    value = {
        for az, details in data.aws_ec2_instance_type_offerings.my_ins_type: az => details.instance_types
    }
}
#Filtered Output: Exclude Unsupported Availabilty Zones
output "output_v3_2"
value = {
    for az, details in data.aws_ec2_instance_type_offerings.my_ins_type2: 
    az => details.instance_types if length(details.instance_types) !=0 })
}
#This will return the list of availabilty zones for an instance type
output "output_v3_3" {
    values = keys({
        for az, details in data.aws_ec2_instance_type_offerings.my_ins_type2: 
        az => details.instance_types if length(details.instance_types) !=0 }) 
}
#Filtered Output: As the Output is list now, get the first item from list (just for learning)
output "output_v3_4" {
    values = keys({
        for az, details in data.aws_ec2_instance_type_offerings.my_ins_type2: 
        az => details.instance_types if length(details.instance_types) !=0 }) [0]
}