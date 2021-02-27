# Cross-Account VPC Peering Connection Accepter
This module can be used to setup the 'Accepter' in a VPC Peering Connection between two AWS Accounts.
An AWS walkthrough is [available here](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/peer-with-vpc-in-another-account.html).

## Usage
```hcl
module "cross_account_vpc_peering_accepter" {
  source = "git@github.com:Opnnio/terraform-modules.git//aws/networking/vpc_peer_cross_account_accepter"

  name                      = "My VPC Peering Connection"
  vpc_peering_connection_id = "pcx-0f2597f797d2d392f"
  destination_cidr_block    = "10.100.8.0/23"
  route_table_ids           = ["rtb-00cc0d8d51b54fb2f", "rtb-0de9106c85a26f40d"]

}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| destination\_cidr\_block | The CIDR block of the requester VPC of the VPC Peering Connection. | string | n/a | yes |
| name | The name to associate with the VPC Peering Connection. | string | n/a | yes |
| route\_table\_ids | A list of routing table IDs in the accepter VPC of the VPC Peering Connection for which routing table entries are created. | list(string) | n/a | yes |
| vpc\_peering\_connection\_id | The VPC Peering Connection ID to manage. | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| route\_ids |  |
| vpc\_peering\_connection\_id |  |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
