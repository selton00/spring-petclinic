variable "AWS_UBUNTU_AMI" {
  type    = string
  default = "ami-04505e74c0741db8d"
}

variable "AWS_INSTANCE_TYPE" {
  type    = string
  default = "t2.micro"
}

variable "environment" {
  type    = string
  default = "dev_infra"
}

