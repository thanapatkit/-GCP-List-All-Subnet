# [GCP] List All Subnet

<img src="https://download.logo.wine/logo/Google_Cloud_Platform/Google_Cloud_Platform-Logo.wine.png" width="350px">

## Prerequisites
Before running the script, please make sure that you have enabled 'Compute Engine API' in your projects.

## Features
1. Get information about VPC Network includes allocating IP for services private connection on GCP projects under your permissions.
2. Export as csv file.

## Least Privilege
In order to execute this module you must have a User/Service Account with the following roles:

- `roles/compute.networkViewer`

## Getting Started
1. Clone the repo
   ```HTTPS
   git clone https://github.com/jamel3ond/-GCP-List-All-Subnet.git
   ```
2. Enter to directory
   ```
   cd ./-GCP-List-All-Subnet/
   ```
3. Run script 
   ```
   /bin/bash list_vpc_and_subnet.sh
   ```

### Example Result from CSV File
```
Project Name	  VPC Name	  Subnet Name	    Subnet IP	        Secondary name	Secondary IP
[Project Name]	[VPC Name]	[Subnet Name]	  10.200.180.0/26	  pod;service	    10.200.208.0/22;10.200.151.0/25
[Project Name]	[VPC Name]	[Subnet Name]	  10.200.180.128/26	pod;service	    10.200.212.0/22;10.200.151.128/25
```
