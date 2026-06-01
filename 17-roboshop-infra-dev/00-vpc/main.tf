module "vpc" {
    # source = "../../15-terraform-aws-vpc"
    source = "git::https://github.com/surekhareddybana/terraform-aws-vpc.git?ref=main"
   # project = "roboshop"
   # enviornment = "dev"
   # public_subnet_cidrs = ["10.0.1.0/24","10.0.2.0/24"]
project = var.project
enviornment = var.environment
public_subnet_cidrs = var.public_subnet_cidrs
private_subnet_cidrs = var.private_subnet_cidrs
database_subnet_cidrs = var.database_subnet_cidrs
#is peering_required = true
}

#output "vpc_id" {
#     value = module.vpc.vpc_id #this vpc_id name manam module developers expose chesaru
  
# }
output "public_subnet_ids" {
    value = module.vpc.public_subnet_ids
  
}