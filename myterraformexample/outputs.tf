output "instance_id" {
  value = aws_instance.demo_instance.id
}

output "vpc_id" {
  value = aws_vpc.demo_vpc.id
}