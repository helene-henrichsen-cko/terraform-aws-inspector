variable "tag" {
  description = "Tag for inspector runs"
  type        = string
  default     = "Inspector"
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
  type        = string
  default     = "cron(0 0/6 * * ? *)"
}

variable "duration" {
  default = 3600
}
