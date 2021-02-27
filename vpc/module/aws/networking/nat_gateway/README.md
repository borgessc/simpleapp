## Providers
aws ~> 1.55

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| private\_subnet\_route\_table\_id | The route table ID associated with the private subnet that will route to the NAT Gateway | string | n/a | yes |
| public\_subnet\_id | The public subnet ID in which the NAT Gateway will be placed | string | n/a | yes |


## Outputs

| Name | Description |
|------|-------------|
| allocation\_id | The allocation ID of the Elastic IP address assigned to the NAT gateway |
| nat\_gateway\_id | The ID of the NAT Gateway created |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
