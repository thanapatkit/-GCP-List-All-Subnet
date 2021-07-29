#!/bin/bash

rm -f $PWD/csv_vpc_subnet.csv

echo Project Name,VPC Name,Subnet Name,Subnet IP,Secondary name,Secondary IP > $PWD/csv_vpc_subnet.csv

while IFS= read -r line
do
    for vpcnetwork in $(gcloud compute networks list --project=$line --format='value(name)')
	do
        for subnet in  $(gcloud compute networks subnets list --project=$line --network=$vpcnetwork --format="value(name)")
        do
            printf "$(gcloud compute networks subnets list --project=$line --network=$vpcnetwork --filter="name=$subnet" --format="value(network,name)")\n"
            project_id=$(gcloud projects describe $line --format="value(name)")
            vpc_name=$(gcloud compute networks subnets list --project=$line --network=$vpcnetwork --filter="name=$subnet" --format="value(network)")
            subnet_name=$(gcloud compute networks subnets list --project=$line --network=$vpcnetwork --filter="name=$subnet" --format="value(name)")
            subnet_ip=$(gcloud compute networks subnets list --project=$line --network=$vpcnetwork --filter="name=$subnet" --format="value(ipCidrRange)")
            secondary_name=$(gcloud compute networks subnets list --project=$line --network=$vpcnetwork --filter="name=$subnet" --format="value(secondaryIpRanges.rangeName)")
            secondary_ip=$(gcloud compute networks subnets list --project=$line --network=$vpcnetwork --filter="name=$subnet" --format="value(secondaryIpRanges.ipCidrRange)")
            echo $project_id,$vpc_name,$subnet_name,$subnet_ip,$secondary_name,$secondary_ip >> $PWD/csv_vpc_subnet.csv
        done
    done
done < $PWD/src/list_projects_id