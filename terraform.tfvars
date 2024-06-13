# For region
region = "ap-south-1"

# For vpc
vpc_name  = "my_vpc"
cidr_block = "10.0.0.0/16"

# FOr Internet gateway
internet_gateway_name = "3tier_igw"

# For subnets
subnet_names = ["web_subnet","app_subnet","db_subnet"]
subnet_cidr_blocks = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
subnet_availability_zones = ["ap-south-1a","ap-south-1b","ap-south-1c"]


# For route tables and associations

route_table_names = ["public_route_table_web_tier","private_route_table_app_tier","private_route_table_db_tier"]
route_table_associations = ["web_tier_route_table_association","app_tier_route_table_association","db_tier_route_table_association"]


ami_id                   = "ami-03f4878755434977f"
instance_type            = "t2.micro"
key_name                 = "3tier-instance"







# For loadbalancer

name = "my-front-end-lb"
internal = "false"
load_balancer_type = "application"
enable_deletion_protection = "false"

# For rds instance

 identifier = "mydb"
 engine = "mysql"
 engine_version = "5.7"
 allocated_storage = "10"
 instance_class = "db.t2.micro"
 username = "admin"
 password = "mydbadmin1234"



