<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cidr\_block | The CIDR block that will be assigned to this VPC | string | n/a | yes |
| enable\_dns\_hostnames | A boolean flag to enable/disable DNS hostnames in the VPC | string | `"false"` | no |
| enable\_dns\_support | A boolean flag to enable/disable DNS support in the VPC | string | `"true"` | no |
| internet\_gateway\_name | The name specified with the VPC | string | `"internet-gateway"` | no |
| vpc\_name | The name specified with the VPC | string | `"VPC"` | no |

## Outputs

| Name | Description |
|------|-------------|
| default\_network\_acl\_id |  |
| default\_route\_table\_id |  |
| default\_security\_group\_id |  |
| internet\_gateway\_id |  |
| vpc\_arn |  |
| vpc\_cidr\_block |  |
| vpc\_id |  |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
