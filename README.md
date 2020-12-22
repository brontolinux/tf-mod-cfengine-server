# tf-mod-cfengine-server

Creates an internet-facing CFEngine server in AWS. This module creates a CFEngine server running in AWS on a Debian 10 instance. Spot instances are supported.

See the [ARCHITECTURE document](ARCHITECTURE.md) for details.

## Requirements

The following requirements are needed by this module:

- terraform (>= 0.13)

- aws (~> 3.21.0)

- template (~> 2.2.0)

## Providers

The following providers are used by this module:

- aws (~> 3.21.0)

- template (~> 2.2.0)

## Required Inputs

The following input variables are required:

### cfengine\_deb\_package\_version

Description: Official deb package version to install (e.g. 3.15.0-2)

Type: `string`

### instance\_name

Description: Value for the Name tag for the instance

Type: `string`

### instance\_sg\_name

Description: Value of the Name tag for the security group that applies to the instance (used to look up the security group for the instance, must be unique)

Type: `string`

### instance\_type

Description: Instance type for the CFEngine server

Type: `string`

### mount\_sg\_name

Description: Value of the Name tag for the security group that applies to the EFS mount targets (used to look up the security group for the EFS mount targets, must be unique)

Type: `string`

### priv\_subnet\_name

Description: Value of the Name tag for the private subnet (used to look up the private subnet for the instance, must be unique)

Type: `string`

### pub\_subnet\_name

Description: Value of the Name tag for the public subnet (used to look up the public subnet for the instance, must be unique)

Type: `string`

### ssh\_key\_name

Description: Name of the SSH key pair to install on the instance

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### ami\_id

Description: Set to 'latest' to use the latest official Debian 'buster' AMI, or specify an AMI ID to use a different one

Type: `string`

Default: `"latest"`

### spot\_instance

Description: Run the client on a spot instance

Type: `bool`

Default: `true`

## Outputs

The following outputs are exported:

### debian\_ami\_id

Description: Id of the latest AMI of Debian 10 for amd64 processors (this is always the ID of the latest AMI, no matter how you set in the ami\_id input variable)

### eip\_address

Description: Public (elastic) IP for the instance

### eip\_name

Description: DNS name associated to the public (elastic) IP for the instance

### instance\_id

Description: Id for the instance running the service

### private\_ip

Description: Private IP for the instance

### private\_subnet\_id

Description: Id of the private subnet (calculated from the subnet name)

### public\_subnet\_id

Description: Id of the public subnet (calculated from the subnet name)

### security\_group\_id

Description: Id of the security group for the instance (calculated from the security group name)

### spot\_instance\_request\_id

Description: Spot instance request id (null if on-demand instances are used)

### ssh\_command

Description: SSH command to run to connect to the instance via SSH

