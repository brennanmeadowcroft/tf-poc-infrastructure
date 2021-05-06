module "main-vpc" {
  source     = "./modules/vpc"
  ENV        = var.ENV
  AWS_REGION = var.AWS_REGION
}

resource "aws_ssm_parameter" "vpc-id-param" {
  name  = "infra-networking-${var.ENV}-vpc-id"
  type  = "String"
  value = module.main-vpc.vpc_id
}

module "lambda-exec-role" {
  source                = "./modules/iam/"
  LAMBDA_EXEC_ROLE_NAME = "lambda-exec-role-12345"
}
