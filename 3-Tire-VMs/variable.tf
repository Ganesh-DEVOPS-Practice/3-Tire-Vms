variable "Env" {
    default = "test"
    description = "Environment for the deployment, e.g., test, prod"
    type = string
}

variable "InstanceType" {
    default = "t3.micro"
    description = "Type of the EC2 instance to be created"
    type = string
}

