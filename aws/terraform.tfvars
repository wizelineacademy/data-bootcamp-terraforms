region = "us-east-2"

vpc_cidr = "10.0.0.0/16"

public_subnets_cidr = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24"]

private_subnets_cidr = [
    "10.0.4.0/24",
    "10.0.5.0/24",
    "10.0.6.0/24"]

availability_zones = [
    "us-east-2a",
    "us-east-2b",
    "us-east-2c"]


destination_cidr_block = "0.0.0.0/0"

cluster_name = "airflow-eks"