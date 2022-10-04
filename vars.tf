variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"
}

variable "ZONE2" {
  default = "us-east-1b"
}

variable "TYPE" {
  default = "t2.micro"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-08d4ac5b634553e16"
    us-east-2 = "ami-051dfed8f67f095f5"
    eu-west-2 = "ami-04842bc62789b682e"
  }
}

variable "PUB_KEY" {
  default = "terraform-aws.pub"
}

variable "PRIV_KEY" {
  default = "terraform-aws"
}

variable "MY_IP" {
  default = "2.83.233.137/32"
}
