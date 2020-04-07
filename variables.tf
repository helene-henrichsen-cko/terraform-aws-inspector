variable "tag" {
  description = "Tag for inspector runs"
  default     = "Inspector"
  type        = "string"
}

variable "environment" {}

variable "project" {}

variable "region" {}

variable "schedule" {
  description = "The frequency of the inspector runs. This is a cron expression."
  default     = "cron(0 0/6 * * ? *)"
  type        = "string"
}

variable "duration" {
  default = "3600"
}

locals {
  enabled_tag {
    "${var.tag}" = "true"
  }
}

output "tags" {
  value = "${local.enabled_tag}"
}
