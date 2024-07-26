variable "sg_id" {
    description = "Security group ID for ALB"
    type = string
  
}

variable "subnets" {
    description = "Subnets for provisiong ALB"
    type = list(string)
  
}
variable "vpc_id" {
    description = "VPC ID for ALB "
    type = string
  
}

variable "instances" {
    description = "EC2 instances ID for Target group attachment"
    type = list(string) 
}