resource "aws_instance" "linux_instance" {
    count = length(local.Names)
    ami           = data.aws_ami.devop_vm_ami.id # Amazon Linux 2 AMI (HVM), SSD Volume Type
    instance_type = "t3.micro"
    vpc_security_group_ids = [data.aws_security_group.test_vm_sg.id]

    tags = {
        Name = local.Names[count.index]
        Environment = var.Env
    }
}