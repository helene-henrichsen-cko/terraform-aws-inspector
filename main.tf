terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  version = "~> 2.0"
  region  = var.region
}

resource "aws_inspector_resource_group" "inspector_rg" {
  tags = {
    "var.tag" = true
  }
}

resource "aws_inspector_assessment_target" "inspector_target" {
  name               = "${var.product}-${var.environment}-inspector-target"
  resource_group_arn = aws_inspector_resource_group.inspector_rg.arn
}

data "aws_inspector_rules_packages" "rules" {
}

resource "aws_inspector_assessment_template" "inspector_template" {
  name       = "${var.product}-${var.environment}-inspector-template"
  target_arn = aws_inspector_assessment_target.inspector_target.arn
  duration   = var.duration

  rules_package_arns = data.aws_inspector_rules_packages.rules.arns
}
