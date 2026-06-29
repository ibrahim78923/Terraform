locals {
  parameter_prefix = startswith(var.prefix, "/") ? trimsuffix(var.prefix, "/") : var.prefix
}

resource "aws_ssm_parameter" "this" {
  for_each = var.parameters

  name  = "/${local.parameter_prefix}/${each.key}"
  type  = each.value.secure ? "SecureString" : "String"
  value = var.placeholder_value
  description = each.value.description != "" ? each.value.description : "${each.key} — set value in AWS Console"

  tags = var.tags

  lifecycle {
    ignore_changes = [value]
  }
}
