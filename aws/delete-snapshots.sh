#!/bin/bash
#This script is to delete all the snapshots owned by an specific AWS Account 
#and prior to some specific date

#Store date based on first positional argument
d=$(date +"$1")

#AWS account number
account=$2

#AWS profile
aws_profile=$3

if [ -z "$d" ] || [ -z "$account" ] || [ -z "$aws_profile" ]; then
	  echo "usage: delete_snapshots.sh <YYYY-mm-dd> <account number> <aws-profile>" 
	    exit 1
fi

to_delete_snap=$(aws ec2 describe-snapshots --owner-ids $account --output text --query "Snapshots[?StartTime<'$d'].SnapshotId" --profile $aws_profile)

for snap in $to_delete_snap; do
  aws ec2 delete-snapshot --snapshot-id $snap --profile $aws_profile
done

