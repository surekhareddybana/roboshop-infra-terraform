locals {
    vpc_id = data.aws_ssm_parameter.vpc_id.value
   # private_subnet_ids = split("," , data.aws_ssm_parameter.private_subnet_ids.value)[0]
    public_subnet_ids = split("," , data.aws_ssm_parameter.public_subnet_ids.value)
    frontend_alb_sg_id = data.aws_ssm_parameter.frontend_alb_sg_id.value
    acm_certificate_arn = data.aws_ssm_parameter.acm_certificate_arn.value
    common_tags = {
project = var.project
enviornment = var.environment
terraform = "true"
}
}