variable "sg_id" {
    description = "SG for EC2 Instance"
    type = string
}

variable "subnets" {
    description = "Subnets for EC2 Instance"
    type = list(string)
}

variable "ec2_names" {
    description = "EC2 Names"
    type = list(string)
    default = ["WebServer1", "WebServer2"]
  
}