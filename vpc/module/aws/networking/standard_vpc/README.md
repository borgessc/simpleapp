
## Standard VPC Terraform Module
This module sets up the following:
* VPC
* Public Subnets
* Private Subnets
* NAT Gateways (NAT GW)
* Internet Gateway (IGW)
* Route tables for private subnets to route via NAT GWs
* Route in default VPC route table to route via IGW

Network diagram for what this terraform module sets up may look similar to the Build VPC on this [wiki page](https://Opnnio.atlassian.net/wiki/spaces/FE/pages/794925183/Build+VPC+Network+Design).

**Note**: The number of availability zones where subnets are created is based on the `availability_zones_details` variable passed into the module. For example the following snippet will create 4 subnets across 2 AZs. You can add additional elements to the list to add additional AZs:
```
availability_zones_details = [
{
    availability_zone         = "us-east-1a"
    public_subnet_cidr_block  = "10.15.0.0/16"
    private_subnet_cidr_block = "10.25.0.0/16"
},
{
    availability_zone         = "us-east-1c"
    public_subnet_cidr_block  = "10.17.0.0/24"
    private_subnet_cidr_block = "10.18.0.0/24"
},
]
```
## Providers
aws ~> 3.3.0
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| availability\_zones\_details | Details of availability zones to setup in VPC. This should be a list of maps with each map containing the following keys: availability_zone, public_subnet_cidr_block, private_subnet_cidr_block | list(map(string)) | n/a | yes |
| cidr\_block | The CIDR block that will be assigned to this VPC | string | n/a | yes |
| enable\_dns\_hostnames | A boolean flag to enable/disable DNS hostnames in the VPC | string | `"false"` | no |
| enable\_dns\_support | A boolean flag to enable/disable DNS support in the VPC | string | `"true"` | no |
| private\_subnet\_tags | A mapping of additional tags to assign to the private subnet resources. | map(string) | `{}` | no |
| public\_subnet\_tags | A mapping of additional tags to assign to the public subnet resources. | map(string) | `{}` | no |
| vpc\_name | The name specified with the VPC | string | n/a | yes |
| vpc\_tags | A mapping of additional tags to assign to the vpc resource. | map(string) | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| internet\_gateway\_id | The internet gateway ID that is attached to the VPC |
| nat\_gateway\_allocation\_ids | The Allocation IDs of the Elastic IP address for the NAT gateways. |
| nat\_gateway\_ids | The ID of the NAT Gateways. |
| nat\_gateway\_network\_interface\_ids | The ENI IDs of the network interface created by the NAT gateways |
| nat\_gateway\_private\_ips | The private IP address of the NAT Gateways. |
| nat\_gateway\_public\_ips | The public IP address of the NAT Gateways. |
| private\_subnet\_arns | The ARN of the private subnets. |
| private\_subnet\_ids | The IDs of the private subnets |
| private\_subnet\_route\_table\_ids | The IDs of the private subnets routing table |
| public\_subnet\_arns | The ARN of the public subnets. |
| public\_subnet\_ids | The IDs of the public subnets |
| vpc\_arn | The ARN of the created VPC |
| vpc\_cidr\_block | The CIDR block of the VPC |
| vpc\_default\_network\_acl\_id | The ID of the network ACL created by default on VPC creation |
| vpc\_default\_route\_table\_id | The ID of the route table created by default on VPC creation |
| vpc\_default\_security\_group\_id | The ID of the security group created by default on VPC creation |
| vpc\_enable\_dns\_hostnames | Whether or not the VPC has DNS hostname support |
| vpc\_enable\_dns\_support | Whether or not the VPC has DNS support |
| vpc\_id | The ID of the VPC |
| vpc\_ipv6\_association\_id | The association ID for the IPv6 CIDR block. |
| vpc\_ipv6\_cidr\_block | The IPv6 CIDR block. |
| vpc\_main\_route\_table\_id | The ID of the main route table associated with this VPC |
| vpc\_owner\_id | The ID of the AWS account that owns the VPC. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
