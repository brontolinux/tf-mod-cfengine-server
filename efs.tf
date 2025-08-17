locals {
  masterfiles_token    = "${var.instance_name}.masterfiles"
  masterfiles_dns_name = aws_efs_file_system.masterfiles.dns_name
  ppkeys_token         = "${var.instance_name}.ppkeys"
  ppkeys_dns_name      = aws_efs_file_system.ppkeys.dns_name
  ia_transition_policy = "AFTER_30_DAYS" # Define the policy or use the value from ec2.tf
}

# EFS filesystem - masterfiles
resource "aws_efs_file_system" "masterfiles" {
  creation_token = local.masterfiles_token

  lifecycle_policy {
    transition_to_ia = local.ia_transition_policy
  }

  tags = {
    Name = local.masterfiles_token
  }
}

resource "aws_efs_mount_target" "masterfiles" {
  file_system_id  = aws_efs_file_system.masterfiles.id
  subnet_id       = data.aws_subnet.private.id
  security_groups = [data.aws_security_group.mount_target.id]
}

# EFS filesystem - ppkeys
resource "aws_efs_file_system" "ppkeys" {
  creation_token = local.ppkeys_token

  lifecycle_policy {
    transition_to_ia = local.ia_transition_policy
  }

  tags = {
    Name = local.ppkeys_token
  }
}

resource "aws_efs_mount_target" "ppkeys" {
  file_system_id  = aws_efs_file_system.ppkeys.id
  subnet_id       = data.aws_subnet.private.id
  security_groups = [data.aws_security_group.mount_target.id]
}
