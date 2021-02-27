# Cross-Account VPC Peering Connection Requester
This module can be used to setup the 'Requester' in a VPC Peering Connection between two AWS Accounts.
An AWS walkthrough is [available here](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/peer-with-vpc-in-another-account.html).

## Usage
```hcl
module "cross_account_vpc_peering_requester" {
  source = "git@github.com:Opnnio/terraform-modules.git//aws/networking/vpc_peer_cross_account_requester"

  name            = "My VPC Peering Connection"
  vpc_id          = "vpc-7c883c1b"
  route_table_ids  = ["rtb-09bc946e"]
  peer_owner_id   = "768643720393"
  peer_region     = "ap-southeast-2"
  peer_vpc_id     = "vpc-0da441a2a90981350"
  peer_cidr_block = "10.60.0.0/22"
  purpose         = "development-environment"
  tribe_owner     = "foundational-engineering"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | The name to associate with the VPC Peering Connection. | string | n/a | yes |
| peer\_cidr\_block | The CIDR block of the accepter VPC with which you are creating the VPC Peering Connection. | string | n/a | yes |
| peer\_owner\_id | The ID of the AWS Account that owns the accepter VPC with which you are creating the VPC Peering Connection. Resources are only created if this variable is a non-empty string. | string | n/a | yes |
| peer\_region | The region of the accepter VPC of the VPC Peering Connection. | string | n/a | yes |
| peer\_vpc\_id | The ID of the accepter VPC with which you are creating the VPC Peering Connection. | string | n/a | yes |
| route\_table\_ids | The IDs of the requester routing tables. | list(string) | n/a | yes |
| vpc\_id | The ID of the requester VPC. | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| route\_id |  |
| vpc\_peering\_connection\_id |  |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
