resource "aws_instance" "linux_instance" {
  count                  = var.instance_count
  ami                    = data.aws_ami.devop_vm_ami.id # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type          = var.instance_names[count.index] == "Database" ? "t3.medium" : "t3.small"
  vpc_security_group_ids = [data.aws_security_group.test_vm_sg.id]

  tags = {
    Name        = var.instance_names[count.index]
    Environment = var.env
  }
}