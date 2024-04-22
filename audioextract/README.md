# Setup

## S3 setup
Follow the instructions in uploader/aws/README.md first, so the
autosub-videoupload bucket is created.

Create two more buckets:
* autosub-audioout - to store the audio files that are created
* autosub-ffmpeg - to store ffmpeg info

Use default sets, private buckets, these only need to be read internally

## IAM Setup
Create a policy and copy in `iam/autosub-audioextract.json` as the contents,
save this policy as autosub-audioextract. Create a role, `autosub-audioextract-lambda`
and attach this policy to that role. This will allow copying between the S3 buckets

## Lambda setup
We need to create an ffmpeg layer
Run `ffmpeg.sh` to create a zip file of the ffmpeg binary for distribution on
lambda.
Upload this zip file to the autosub-ffmpeg s3 bucket, and click on the file and
get the object URL.

Go to Lambda, Layers, create layer named ffmpeg, select upload a file from Amazon S3,
put in the URL to autosub-ffmpeg/ffmpeg.zip and select the Python 3.8 runtime

Create a function called `autosub-extract-audio`, set the runtime to be
Python 3.8, change the default execution role and add in use an existing role,
and select the autosub-audioextract-lambda role.

Once created, scroll down to layers, and add a closer. Choose custom layers
and select the ffmpeg layer.

Configure the trigger for the lambda and select an S3 trigger, and set the
trigger to be the autosub-videoupload bucket, with no other configuration -
just the default all object create events trigger

Edit the basic settings of the function, and increase the memory to 2240 MB and
the timeout to be 1 minute. For longer videos these numbers may need to increase.

Include the code found in `lambda_function.py` and press "Deploy". All should be
setup now to run.
