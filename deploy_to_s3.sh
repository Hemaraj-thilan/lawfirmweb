#!/bin/bash
set -e
# Usage: ./deploy_to_s3.sh <bucket-name> <region>
BUCKET="$1"
REGION="${2:-ap-south-1}"

if [ -z "$BUCKET" ]; then
  echo "Usage: $0 <bucket-name> [region]"
  exit 1
fi

echo "Syncing site to s3://$BUCKET (region: $REGION)"
aws s3 sync . "s3://$BUCKET" --exclude ".git/*" --acl public-read --delete
echo "Setting S3 website configuration"
aws s3 website "s3://$BUCKET" --index-document index.html --error-document index.html

echo "Done. Website should be available at:"
echo "http://$BUCKET.s3-website-$REGION.amazonaws.com"
