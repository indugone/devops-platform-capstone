variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Availability zone"
  default     = "us-east-1a"
}

variable "ami_id" {
  description = "Amazon Linux 2 AMI ID"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.micro"
}
