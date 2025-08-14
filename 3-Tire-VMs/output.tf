# output "public_ip" {
#   value = aws_instance.linux_instance[*].public_ip
# }

output "public_ip" {
  value = [
    for instance in aws_instance.linux_instance :
    "${instance.tags["Name"]} : ${instance.public_ip}"
  ]
}