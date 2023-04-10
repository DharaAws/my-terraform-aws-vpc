module "vpc" {
  source = "../modules/vpc"


  product            = "bliss"
  environment        = "dev"
  vpc_cidr           = "10.0.0.0/23"
  tenancy            = "default"
  public_subnets     = "10.0.0.0/25,10.0.0.128/25"
  private_subnets    = "10.0.1.0/25,10.0.1.128/25"
  availability_zones = "us-east-1a,us-east-1b"
}

# module "vpc" {
#   source = "../modules/vpc"

#   vpc_cidr_block = var.vpc_cidr_block
#   subnet_cidr_blocks = var.subnet_cidr_blocks
# }

# module "ec2" {
#   source = "../modules/ec2"

#   ami_id = var.ami_id
#   instance_type = var.instance_type
#   subnet_ids = module.vpc.private_subnet_ids
#   sg_ids = module.vpc.sg_ids
# }

# module "alb" {
#   source          = "terraform-aws-modules/alb/aws"
#   name            = "dev-alb"
#   security_groups = [module.vpc.default_security_group_id]
#   subnets         = module.vpc.public_subnets
# }