variable "region" {
  default = "us-east-2"
  type = string
  description = "default region"
}
variable "region1" {
  default = "us-west-1"
  type = string
  description = "extended region"
}

variable "user-name" {
    default = "madd"
    type = string
    description = "iam user name"
  
}

variable "policy-name" {
    default = "maddpolicy"
    type = string
    description = "iam user policy name"
}

variable "ami_web" {
    default = "ami-08be1e3e6c338b037"
    type = string
    description = "12.micro"
  
}

variable "ami_web2" {
    default = "ami-055db685a6d9d5646"
    type = string
    description = "12.micro"
}

variable "instance_type_web" {
    default = "t2.micro"
    type = string
    description = "ec2 instance"
      
}

variable "instance_type_web2" {
    default = "t2.micro"
    type = string
    description = "ec2 instance2"
}

variable "tagName" {
    default = "MaddPolicy"
  
}
variable "policy_arn" {
    default = "arn:aws:iam::aws:policy/AlexaForBusinessFullAccess"
    type = string
    description = "policy arn"
      
}

      
