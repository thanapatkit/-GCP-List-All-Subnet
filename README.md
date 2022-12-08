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
Project Name      VPC Name       Subnet Name       Subnet IP            Secondary name    Secondary IP                        Remark
[Project Name]    [VPC Name]     [Subnet Name]     [IP Address]      [Secondary Name];[Secondary Name]       [IP_Address];[IP_Address]   
[Project Name]    [VPC Name]     [Subnet Name]     [IP Address]    [Secondary Name];[Secondary Name]       [IP_Address];[IP_Address]
[Project Name]    [VPC Name]     [Allocate Name]   [IP Address]                                                            Allocate IP Range 
```
