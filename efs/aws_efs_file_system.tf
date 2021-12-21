resource "aws_efs_file_system" "efs-fs" {
  creation_token = var.creation_token
  encrypted      = var.encrypted
  kms_key_id     = data.aws_kms_alias.efs_kms.id

  performance_mode = var.performance_mode
  throughput_mode  = var.throughput_mode

  tags = {
    Name        = var.creation_token
    Environment = var.envrionment
    CreatedBy   = var.created_by
  }
}

resource "aws_efs_mount_target" "efs-mount-target" {
 // The ID of the file system for which the mount target is intended."
  file_system_id  = aws_efs_file_system.efs-fs.id
  // mount the efs to all the available private subnets.
  for_each        = data.aws_subnet_ids.private_aws_subnet_ids.ids
  subnet_id       = each.value
  security_groups = [aws_security_group.efs-sg.id]
}