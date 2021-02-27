# Config Remote Terraform State and Lock state

This config will configure terraform to store the Terraform state remotely

Also for team colabaration the lock state will set on each table related to 
each resource.


## Setting mfa_delete

Setting `mfa_delete` on tfstate buckets will ensure and prevent an accidental 
deletion for Terraform state file without use MFA authentication.

## How to set *_mfa_delete_*

To enable `mfa_delete`, we will need to :

*  Run terraform using normal IAM credentials to create the S3 bucket - it will
fail to set `mfa_delete`
* Login to AWS console using the root account credentials
* Generate access keys for  the root account
* Using the root access keys, run the following command
```
aws s3api put-bucket-versioning --bucket BUCKET_NAME --versioning-configuration 
 Status=Enabled, MFADelete=Enabled --mfa "MFA_DEVICE_SERIAL MFA_TOKEN"
 ```
* Re-run terraform , it should succeed this time
* Delete the root access keys you've created
