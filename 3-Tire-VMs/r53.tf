resource "aws_route53_record" "linux_instance_Record" {
    count = var.instance_count
    zone_id         = data.aws_route53_zone.my_hosted_zone.id
    name            = var.instance_names[count.index] != "Frontend" ? "${lower(var.instance_names[count.index])}.ganeshdevops.space" : "ganeshdevops.space"
    type            = "A"
    ttl             = 1
    # records         = [ 
    #     for my_instance in aws_instance.linux_instance : 
    #     my_instance.tags["Name"] == "Frontend" ? my_instance.public_ip : my_instance.private_ip 
    #     ]
    records         = [ var.instance_names[count.index] == "Frontend" ? aws_instance.linux_instance[count.index].public_ip : aws_instance.linux_instance[count.index].private_ip]
    allow_overwrite = true

}