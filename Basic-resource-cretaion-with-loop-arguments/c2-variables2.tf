#AWS EC2 Instance Type - List
variable "instance_type_list" {
    description = "EC2 Instance Type"
    type = list(string)
    default = ["t2.micro", "t2.medium"]
}
#AWS EC2 Instance Type - Map
variable "instance_type_map" {
    description = "EC2 Instance Type"
    type = map(string)
    default = {
      "dev" = "t2.micro" 
      "qa" = "t2.medium"
    }
}