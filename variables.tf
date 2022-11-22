variable "ami" {
  type=string
  default="ami-0b0dcb5067f052a63"
}

variable "instancetype" {
  type=string
  default="t2.micro"
}

variable "access_key" {
  type=string
  default=""
}

variable "secret_key" {
  type=string
  default=""
}

variable "region" {
  type=string
  default="us-east-1"
}

variable "keyname" {
  type=string
  default="test"
}

