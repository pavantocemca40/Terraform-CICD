variable "vpc_cidr" {
    description = "VPC CIDR range"
    type = string  
}

variable "subnet_cidr" {
    description = "Subnet CIDR ranges"
    type = list(string)  
}

variable "subnet_names" {
    description = "Subnet names"
    type = list(string)
    default = [ "PublicSubnet1", "PublicSubnet2" ]
  
}