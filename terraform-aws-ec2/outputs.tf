output "instance_id" {
  value = aws_instance.elie-dg-terraform-test.id
}


output "instance_public_ip" {
  value = aws_instance.elie-dg-terraform-test.public_ip
}
