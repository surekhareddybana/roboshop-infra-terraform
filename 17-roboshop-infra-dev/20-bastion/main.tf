resource "aws_instance" "bastion" {
    ami = local.ami_id
    instance_type = "t3.micro" 
    vpc_security_group_ids = [local.bastion_sg_id]
    subnet_id = local.public_subnet_ids
tags = merge (
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}-bastion"
    }
)

}
resource "aws_route53_record" "bastion" {
    zone_id = var.zone_id
    name = "vpn-${var.environment}.${var.zone_name}"
    type = "A"
    ttl = 1
    records = [aws_instance.bastion.public_ip]
    allow_overwrite = true
 }