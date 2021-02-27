<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| allow\_remote\_vpc\_dns\_resolution\_acceptor | Allow a local VPC to resolve public DNS hostnames to private IP addresses when queried from instances in the peer VPC | string | `"true"` | no |
| allow\_remote\_vpc\_dns\_resolution\_requestor | Allow a local VPC to resolve public DNS hostnames to private IP addresses when queried from instances in the peer VPC | string | `"true"` | no |
| environment\_exists |  | bool | n/a | yes |
| peering\_name | The name given to the peering connection | string | n/a | yes |
| source\_vpc\_id | The VPC ID for the source VPC to be peered | string | n/a | yes |
| target\_region | The AWS region the target VPC is provisioned in | string | n/a | yes |
| target\_vpc\_id | The VPC ID for the target VPC to be peered to | string | n/a | yes |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
