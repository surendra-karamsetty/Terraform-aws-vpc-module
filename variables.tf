variable "project" {
    type = string
}

variable "environment" {
    type = string
}

variable "cider_block" {
    type = string
    default = "10.0.0.0/16"
}

variable "vpc_tags" {
    type = map
    default = {}
      
}