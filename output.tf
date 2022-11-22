output "instance_id" {
   value = aws_instance.web.id
}
output "instance_publicip" {
   value = aws_instance.web.public_ip
}