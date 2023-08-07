# VPC variables
variable "vpc_cidr" {
    default = "10.0.0.0/16"
    description = "vpc cidr block"
    type = string
}
variable "Public_subnet_cidr" {
    default = "10.0.0.0/24"
    description = "Public_subnet_cidr block"
    type = string
}
variable "Public_subnet_az2" {
    default = "10.0.1.0/24"
    description = "Public_subnet_az2_cidr"
    type = string
}
variable "Private_app1_subnet_cidr" {
    default = "10.0.2.0/24"
    description = "Private1_subnet_cidr block"
    type = string
}
variable "Private_app2_subnet_cidr" {
    default = "10.0.3.0/24"
    description = "Private2_subnet_az2_cidr"
    type = string
}
variable "Private_data1_subnet_cidr" {
    default = "10.0.4.0/24"
    description = "Private1data_subnet_cidr block"
    type = string
}
variable "Private_data2_subnet_cidr" {
    default = "10.0.5.0/24"
    description = "Private2data_subnet_az2_cidr"
    type = string
}
