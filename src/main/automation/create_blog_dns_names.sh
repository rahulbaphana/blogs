#!/usr/bin/env bash

# Create CNAME records for blogs for the usernames

export SCRIPT_NAME="$0"
if [ $# -ne 4 ]
then
    echo "Missing arguments"
    echo "Usage: $SCRIPT_NAME profile sub-domain hosted-zone-id path-to-change-set"
    exit 1
fi

export SUB_DOMAIN="$2"
export HOSTED_ZONE_ID="$3"
export PATH_TO_CHANGE_SET="$4"
export REGION_NAME="eu-west-1"

while read username
do
    echo "For user ${username}"
    export BUCKET_NAME="${username}.${SUB_DOMAIN}"
    export FQDN="${BUCKET_NAME}.equalexperts.in"
    export POINTS_TO="${BUCKET_NAME}.s3-website-${REGION_NAME}.amazonaws.com"
    cp cname_resource_record_set.json.template cname_resource_record_set.json
    sed -i '' "s/FQDN/${FQDN}/" cname_resource_record_set.json
    sed -i '' "s/POINTS_TO/${POINTS_TO}/" cname_resource_record_set.json

    aws --profile $1 route53 change-resource-record-sets --hosted-zone-id ${HOSTED_ZONE_ID} --change-batch file://${PATH_TO_CHANGE_SET}/cname_resource_record_set.json
done < users
