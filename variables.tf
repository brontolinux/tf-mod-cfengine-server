variable "pub_subnet_name" {
  description = "Value of the Name tag for the public subnet (used to look up the public subnet for the instance, must be unique)"
  type        = string
}

variable "priv_subnet_name" {
  description = "Value of the Name tag for the private subnet (used to look up the private subnet for the instance, must be unique)"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the CFEngine server"
  type        = string
}

variable "instance_name" {
  description = "Value for the Name tag for the instance"
  type        = string
}

variable "ssh_key_name" {
  description = "Name of the SSH key pair to install on the instance"
  type        = string
}

variable "instance_sg_name" {
  description = "Value of the Name tag for the security group that applies to the instance (used to look up the security group for the instance, must be unique)"
  type        = string
}

variable "mount_sg_name" {
  description = "Value of the Name tag for the security group that applies to the EFS mount targets (used to look up the security group for the EFS mount targets, must be unique)"
  type        = string
}

variable "cfengine_deb_package_version" {
  description = "Official deb package version to install (e.g. 3.15.0-2)"
  type        = string
}

variable "spot_instance" {
  description = "Run the client on a spot instance"
  default     = true
}

variable "ami_id" {
  description = "Set to 'latest' to use the latest official Debian 'buster' AMI, or specify an AMI ID to use a different one"
  default     = "latest"
}
