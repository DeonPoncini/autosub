# AWS Architecture

## S3 Bucket
Create a bucket in s3, called autosub-videoupload for all the videos to be
uploaded to. In permissions, set block all public access to off.

In permissions, apply `s3/autosub-videoupload-bucketpolicy.json` as the bucket
policy, and `s3/autosub-videoupload-cors.json` as the CORS policy

## Policies
To create an upload policy, go to IAM, and select Policies, and "Create policy".
Add `iam/autosub-videoupload-s3upload.json` as the policy and save this.

## Users
Create a user in IAM for video uploading. For example, autosub-videoupload.
Apply the policy found in `iam/autosub-videoupload-s3upload.json`, by going to
the user in IAM, selecting Add permissions from the permission policies drop down,
add permissions, then selecting "Attach policies directly" and selecting the
policy that was created in the policies section above.

## Local configuration
Create an access key for the user, within IAM by going to the user, selecting
"Create access key" and selecting local code. Create the key and copy the key and
secret key down. Get the file at `local/env` and copy it to the root next to
`package.json` as `.env`, and then put in the AWS Key and secret key into this
file. Make sure the s3 bucket region is the same region that the bucket was
created in

