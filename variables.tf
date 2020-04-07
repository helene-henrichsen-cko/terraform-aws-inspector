variable "tag" {
  description = "Tag for inspector runs"
  default     = "Inspector"
  type        = string
}

variable "environment" {
  description = "environment to deploy to"
  type        = string
  default     = "test"
}

variable "product" {
  description = "Product that will benefit the infrastructure"
  type        = string
  default     = "test"
}

variable "region" {
  description = "AWS region where the VPC will be created"
  type        = string
  default     = "eu-west-1"
}

variable "schedule" {
  description = "The frequency of the inspector runs. This is a cron expression."
  default     = "cron(0 0/6 * * ? *)"
  type        = string
}

variable "duration" {
  default = 3600
}

locals {
  enabled_tag = {
    "var.tag" = true
  }
}
