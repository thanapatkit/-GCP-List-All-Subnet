#!/bin/bash

rm -f $PWD/csv_vpc_subnet.csv

echo Project Name,VPC Name,Subnet Name,Subnet IP,Secondary name,Secondary IP,Remark > $PWD/csv_vpc_subnet.csv

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

while IFS= read -r line2
do
    for allocateip in $(gcloud compute addresses list --global --filter="purpose=VPC_PEERING" --project=$line2 --format='value(name)')
	do
        printf "$(gcloud compute addresses list --global --filter=$allocateip --project=$line2 --format='value(network.scope(),name)')\n"
        project_id=$(gcloud projects describe $line2 --format="value(name)")
        vpc_name=$(gcloud compute addresses list --global --filter=$allocateip --project=$line2 --format='value(network.scope())')
        subnet_name=$(gcloud compute addresses list --global --filter=$allocateip --project=$line2 --format='value(name)')
        address=$(gcloud compute addresses list --global --filter=$allocateip --project=$line2 --format='value(address)')
        prefixLength=$(gcloud compute addresses list --global --filter=$allocateip --project=$line2 --format='value(prefixLength)')
        subnet_ip="${address}/${prefixLength}"
        secondary_name=" "
        secondary_ip=" "
        remark="Allocate IP Range"
        echo $project_id,$vpc_name,$subnet_name,$subnet_ip,$secondary_name,$secondary_ip,$remark >> $PWD/csv_vpc_subnet.csv
    done
done < $PWD/src/list_projects_id