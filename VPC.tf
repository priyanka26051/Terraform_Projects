//Create VPC
resource "aws_vpc" "myvpc" {
    cidr_block = var.vpc_cidr
    instance_tenancy = "default"
    enable_dns_hostnames = true

 tags = {
    Name = "Three_VPC"
 } 
  }

// Create Internet gateway
resource "aws_internet_gateway" "internet_Gateway" {
    vpc_id = aws_vpc.myvpc.id

 tags = {
    Name = "Three_InterGateway"
 } 
  } 

// Create Public Subnet 1
resource "aws_subnet" "Public_subnet_az1" {
    vpc_id             = aws_vpc.myvpc.id
    cidr_block         = var.Public_subnet_cidr
    availability_zone  = "us-west-2a"
    map_public_ip_on_launch = true
  
tags = {
    Name = "Public_Subnet"
 } 
  } 

resource "aws_subnet" "Public_subnet_az2" {
    vpc_id             = aws_vpc.myvpc.id
    cidr_block         = var.Public_subnet_az2
    availability_zone  = "us-west-2b"
    map_public_ip_on_launch = true
  
tags = {
    Name = "Public_Subnet2"
 } 
  }   

//Create Route table and add public route
resource "aws_route_table" "Public_Route_Table" {
    vpc_id             = aws_vpc.myvpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet_Gateway.id
    }

 tags = {
    Name = "Public_Route"
 } 
  }     

# Associate public subnet az2 to public route table
resource "aws_route_table_association" "Public_Subnet_Asso1" {
    subnet_id = aws_subnet.Public_subnet_az1.id
    route_table_id = aws_route_table.Public_Route_Table.id
}   

resource "aws_route_table_association" "Public_Subnet_Asso2" {
    subnet_id = aws_subnet.Public_subnet_az2.id
    route_table_id = aws_route_table.Public_Route_Table.id

}  

#Create Private App subnet az1

resource "aws_subnet" "Private_app_subnet_az1" {
    vpc_id             = aws_vpc.myvpc.id
    cidr_block         = var.Private_app1_subnet_cidr
    availability_zone  = "us-west-2a"
    map_public_ip_on_launch = false
  
tags = {
    Name = "Private_App_Subnet1"
 } 
  } 
//Create Private App subnet az2
resource "aws_subnet" "Private_app_subnet_az2" {
    vpc_id             = aws_vpc.myvpc.id
    cidr_block         = var.Private_app2_subnet_cidr
    availability_zone  = "us-west-2b"
    map_public_ip_on_launch = false
  
tags = {
    Name = "Private_App_Subnet2"
  } 
}
# Create subnet for private data

resource "aws_subnet" "Private_data_subnet_az1" {
    vpc_id             = aws_vpc.myvpc.id
    cidr_block         = var.Private_data1_subnet_cidr
    availability_zone  = "us-west-2a"
    map_public_ip_on_launch = false
  
tags = {
    Name = "Private_data_Subnet1"
 } 
  } 
# Create Private data subnet az2
resource "aws_subnet" "Private_data_subnet_az2" {
    vpc_id             = aws_vpc.myvpc.id
    cidr_block         = var.Private_data2_subnet_cidr
    availability_zone  = "us-west-2b"
    map_public_ip_on_launch = false
  
tags = {
    Name = "Private_data_Subnet2"
  } 
}











