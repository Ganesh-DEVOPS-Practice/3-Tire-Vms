variable "env" {
  default     = "test"
  description = "Environment for the deployment, e.g., test, prod"
  type        = string
}


variable "instance_count" {
  #default     = 3
  type        = number
  description = "Number of EC2 instances to create"
}

variable "instance_names" {
  #default     = ["Database", "Backend", "Frontend"]
  type        = list(string)
  description = "Names for the EC2 instances"
}