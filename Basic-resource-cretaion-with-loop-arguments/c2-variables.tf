#Input Variabkes
#Aws Region
variable "aws_region" {
    description = "Region in which AWS Resources to be created"
    type = string
    default = "us-west-1"
}
#AWS EC2 Instance Type
variable "aws_instance" {
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
