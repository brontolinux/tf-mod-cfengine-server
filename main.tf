/*
* # tf-mod-cfengine-server
*
* This module creates an internet-facing CFEngine server running in AWS on a Debian 10 instance. Spot instances are supported.
*
* See the [ARCHITECTURE document](ARCHITECTURE.md) for details.
*/

########################################################################
# Data collection

# Subnets
data "aws_subnet" "public" {
  tags = {
    Name = var.pub_subnet_name
  }
}

data "aws_subnet" "private" {
  tags = {
    Name = var.priv_subnet_name
  }
}

# Security groups
data "aws_security_group" "cfserver" {
  name = var.instance_sg_name
}

data "aws_security_group" "mount_target" {
  name = var.mount_sg_name
}

# Official Debian 13 AMI, latest
data "aws_ami" "debian_official" {
  most_recent = true
  name_regex  = "^debian-13-amd64-.+"

  # Owner of official debian AMIs
  # See https://wiki.debian.org/Cloud/AmazonEC2Image/
  owners = ["136693071363"]

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}
