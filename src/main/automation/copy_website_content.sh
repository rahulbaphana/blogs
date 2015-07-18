#!/usr/bin/env bash

# Copy content recursively from public_html to the destination website hosting bucket

export SCRIPT_NAME="$0"
if [ $# -ne 2 ]
then
    echo "Missing arguments"
    echo "Usage: $SCRIPT_NAME profile bucket-name"
    exit 1
fi

export BUCKET_NAME="$2"
aws --profile $1 s3 sync ../public_html s3://${BUCKET_NAME}
