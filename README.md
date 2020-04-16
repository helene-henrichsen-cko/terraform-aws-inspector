# AWS Inspector Module

Terraform module which creates the AWS Inspector Service.

Amazon Inspector is an automated security assessment service that helps improve the security and compliance of applications deployed on AWS. Amazon Inspector automatically assesses applications for exposure, vulnerabilities, and deviations from best practices. After performing an assessment, Amazon Inspector produces a detailed list of security findings prioritized by level of severity.

For example: Unintended network accessibility of EC2 instances.

***

## Terraform versions

Terraform >= 0.12

## Usage

```
module "aws_inspector" {
  source = "git@github.com:cko-core-terraform/terraform-aws-inspector.git?ref=0.0.1"

  project      = "${var.project}"
  environment  = "${var.environment}"
  region       = "${var.region}"
  tag          = "Inspector"
  schedule     = "cron(0 0/6 * * ? * )"
}
```

## Examples

No examples yet.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| duration | n/a | `number` | `3600` | no |
| environment | environment to deploy to | `string` | `"test"` | no |
| product | Product that will benefit the infrastructure | `string` | `"test"` | no |
| region | AWS region where the VPC will be created | `string` | `"eu-west-1"` | no |
| schedule | The frequency of the inspector runs. This is a cron expression. | `string` | `"cron(0 0/6 * * ? *)"` | no |
| tag | Tag for inspector runs | `string` | `"Inspector"` | no |

## Outputs

| Name | Description |
|------|-------------|
| tags | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Third party software
This repository uses third party software:
* [pre-commit](https://pre-commit.com/) - Used to help ensure code and documentation consistency
  * Install with `brew install pre-commit`
  * Manually use with `pre-commit run`
* [terraform-docs](https://github.com/segmentio/terraform-docs) - Used to generate the [Inputs](#Inputs) and [Outputs](#Outputs) sections
  * Install with `brew install terraform-docs`
  * Manually use via pre-commit

## .gitignore
*.terraform
*.tfstate
*.zip
