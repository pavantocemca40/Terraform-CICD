output "vpc_id" {
    value = aws_vpc.terraform_vpc.id
}

output "subnet_ids" {
    value = aws_subnet.subnets.*.id
}