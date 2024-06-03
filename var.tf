variable "AWS_REGION" {
    default = "us-east-1"  
}

variable "AMI" {
    type = "map"

    default = {
        us-east-1 = "ami-0c2a1acae6667e438"
    }
  
}

variable "PRIVATE_KEY_PATH" {
  default = "Virginia-region-key-pair"
}

variable "PUBLIC_KEY_PATH" {
  default = "Virginia-region-key-pair.pub"
}

variable "EC2_USER" {
  default = "ubuntu"
}