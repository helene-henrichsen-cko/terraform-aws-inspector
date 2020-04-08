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
## Requirements

| Name      | Version   |
|-----------|-----------|
| terraform | >= 0.12.0 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| Project | Which project this belongs to | `string` | `""` | Yes |
| Environment | Which environment this will be deployed to | `string` | `""` | Yes |
| Region | Which region this will be deployed to | `string` | `""` | Yes |
| Tag | Tags used to identify instances as inspector targets | `string` | `"Inspector"` | No |
| Schedule  | This is a cron expression for how often Inspector will run | `string` | `"cron(0 0/6 * * ? * )"` | No |

## Outputs

No outputs.

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
