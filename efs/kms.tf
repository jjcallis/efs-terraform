resource "aws_kms_key" "efs" {
  description = "The KMS key used by the ${var.creation_token}"
}

resource "aws_kms_alias" "efs_alias" {
  name          = var.kms_alias
  target_key_id = aws_kms_key.efs.key_id
}