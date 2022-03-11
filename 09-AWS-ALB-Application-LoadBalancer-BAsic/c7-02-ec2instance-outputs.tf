# AWS EC2 Instance Terraform Outputs
# Public EC2 Instances - Bastion Host
#Ec2_public_instance_ids
output "ec2_bastion_public_instance_ids" {
  description = "List of IDs of instances"
  value       = module.ec2_public.id
}
#Ec2_public_instance_ip
output "ec2_bastion_public_ip" {
  description = "List of Public ip address assigned to the instances"
  value       = module.ec2_public.public_ip
}
# Private EC2 Instances
#Ec2_private_instance_ids
output "ec2_private_instance_ids" {
  description = "List of IDs of instances"
  value       = module.ec2_private.id
}
#Ec2_private_instance_ip
output "ec2_private_ip" {
  description = "List of private ip address assigned to the instances"
  value       = module.ec2_private.private_ip
}