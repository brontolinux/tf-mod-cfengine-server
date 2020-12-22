# tf-mod-cfengine-server: how it works

# Architecture

The module will create:

1. an AWS instance (a spot instance unless you specify otherwise)
2. an EFS filesystem for the CFEngine masterfiles, that will be mounted on the instance under `/var/cfengine/masterfiles`;
3. an EFS filesystem for the CFEngine server keys and the public keys collected by the server, that will be mounted on the instance under `/var/cfengine/ppkeys`;
4. a public elastic IP that will be attached to the AWS istance to make it accessible from the Internet, according to the rules established by the assigned security groups.

The module does **not** provide for the case where the two EFS filesystems are shared across multiple instances. It is probably possible to modify the module to either create the EFS filesystems or use existing ones, however: I didn't need that functionality and adding it would have required more time than I could afford. Pull requests are more than welcome, in case you feel like adding that functionality to everyone's benefit.


# Prerequisites

1. a VPC with a private and a public subnet;
2. the public subnet must be accessible from/have access to the Internet;
3. the private subnet is reachable from the public subnet;
3. the subnets are identified by unique `Name` tags;
4. a security group applicable to the instance exists **before** the instance is created, and is tagged with a unique `Name` tag;
5. a security group applicable to the EFS mount targets exists **before** the instance and the mount targets are created, and is tagged with a unique `Name` tag;
6. the module creates the instance using the latest Debian 10 AMI, unless you specify a different AMI ID; please notice that **the user data assumes a Debian system**: using a Debian derivative **may** work, using non-Debian-based distributions will **not** work.

The mount targets will be created in the private network. This is the reason why the private network must be accessible from the public network. 

The masterfiles are distributed to all clients: **ensure you are protecting the mount targets appropriately**. The security group applied to the mount target must grant only the required access, and only to those instances that need that access.

The spot instance request will expire after six months. New Debian AMIs with security updates are released more or less every three months on average, and replacing a server with a new one is a seamless process thanks to Terraform and this module. Six months should give you plenty of space to recycle existing instances with new ones.


