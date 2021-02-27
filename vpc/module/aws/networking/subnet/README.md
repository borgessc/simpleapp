<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| availability\_zone | The AWS avaliablitity zone the subnet will be provisoned in | string | n/a | yes |
| name | Used for tagging. The name tag allows to catergoise the use of the subnet | string | `""` | no |
| public\_ip | Specify true to indicate that instances launched into the subnet should be assigned a public IP address | string | `"false"` | no |
| route\_table\_id | The Route table ID used for the public subnets | string | n/a | yes |
| subnet\_cidr\_block | The CIDR block that will be associated with the private subnet that is being created | string | n/a | yes |
| subnet\_name | The name that will be given the the subnet | string | `"Managed Subnet"` | no |
| vpc\_id | The ID of the inter-region VPC | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| subnet\_id |  |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
