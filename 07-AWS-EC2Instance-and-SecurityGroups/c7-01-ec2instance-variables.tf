#AWS EC2 Private Instance Count
variable "private_instance_count" {
    description = "AWS EC2 Private Instances Ckunt"
    type = number
    default = 1
}
#AWS EC2 Instance Type
variable "instance_type" {
    description = "EC2 Instance Type"
    type = string
    default = "t2.medium"

}
#AWS EC2 Instance Key Pair
variable "instance_keypair" {
    description = "AWS EC2 Key Pair that need to be associated with EC2 instance"
    type = string
    default = "ansd"
}
