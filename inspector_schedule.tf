data "aws_iam_policy_document" "inspector_assessment_run_trust" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "inspector_assessment_run" {
  statement {
    effect    = "Allow"
    actions   = ["inspector:StartAssessmentRun"]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "inspector_assessment_run" {
  name   = "InspectorAssessmentRun"
  role   = aws_iam_role.inspector_assessment_run.name
  policy = data.aws_iam_policy_document.inspector_assessment_run.json
}

resource "aws_iam_role" "inspector_assessment_run" {
  name               = "InspectorAssessmentRun"
  assume_role_policy = data.aws_iam_policy_document.inspector_assessment_run_trust.json
}

data "aws_caller_identity" "current" {
}

resource "aws_cloudwatch_event_target" "inspector_time_schedule" {
  target_id = "${var.product}-${var.environment}-inspector-schedule"
  rule      = aws_cloudwatch_event_rule.inspector_time_schedule.name
  arn       = aws_inspector_assessment_template.inspector_template.arn
  role_arn  = aws_iam_role.inspector_assessment_run.arn
}

resource "aws_cloudwatch_event_rule" "inspector_time_schedule" {
  name                = "${var.product}-${var.environment}-inspector-schedule"
  schedule_expression = var.schedule
}
