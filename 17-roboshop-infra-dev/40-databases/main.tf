resource "aws_instance" "mongodb" {
    ami = local.ami_id
    instance_type = "t3.micro" 
    vpc_security_group_ids =[ local.mongodb_sg_id ]
    subnet_id = local.database_subnet_ids
    
tags = merge (
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}-mongodb"
    }
)

}
#terraform data nothing but null resource
resource "terraform_data" "mongodb" {
    triggers_replace = [ #instance create ayyaka edi trigger avvali
        aws_instance.mongodb.id
    ]
    provisioner "file" {
        source = "bootstarp.sh"
        destination = "/tmp/bootstarp.sh"
    }
        
   connection {
    type  = "ssh"
    user = "ec2-user"
    password = "DevOps321"
    host  = aws_instance.mongodb.private_ip
    bastion_host        = "34.229.59.255"
    bastion_user        = "ec2-user"
    bastion_password    = "DevOps321"
  }
# for execution
  provisioner "remote-exec" {
    inline  = [
      "chmod +x /tmp/bootstarp.sh",
      "sudo sh /tmp/bootstarp.sh mongodb"
    ]
  }
}
   resource "aws_route53_record" "mongodb" {
    zone_id = var.zone_id
    name = "mongodb.${var.zone_name}"
    type = "A"
    ttl = 1
    records =  [aws_instance.mongodb.private_ip]
    allow_overwrite = true
}
    resource "aws_route53_record" "mysql" {
  zone_id = var.zone_id
  name = "mysql.${var.zone_name}"
  type = "A"
  ttl = 1
  records = [aws_instance.mysql.private_ip]
  allow_overwrite = true
}
resource "aws_route53_record" "rabbitmq" {
    zone_id = var.zone_id
    name = "rabbitmq.${var.zone_name}"
    type = "A"
    ttl = 1
    records = [aws_instance.rabbitmq.private_ip]
    allow_overwrite = true


  }
 resource "aws_instance" "redis" {
    ami = local.ami_id
    instance_type = "t3.micro" 
    vpc_security_group_ids =[ local.redis_sg_id ]
    subnet_id = local.database_subnet_ids
    
tags = merge (
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}-redis"
    }
)

}
#terraform data nothing but null resource
resource "terraform_data" "redis" {
    triggers_replace = [ #instance create ayyaka edi trigger avvali
        aws_instance.redis.id
    ]
    provisioner "file" {
        source = "bootstarp.sh"
        destination = "/tmp/bootstarp.sh"
    }
        
   connection {
    type  = "ssh"
    user = "ec2-user"
    password = "DevOps321"
    host  = aws_instance.redis.private_ip
    bastion_host        = "34.229.59.255"
    bastion_user        = "ec2-user"
    bastion_password    = "DevOps321"
  }
# for execution
  provisioner "remote-exec" {
    inline  = [
      "chmod +x /tmp/bootstarp.sh",
      "sudo sh /tmp/bootstarp.sh redis"
    ]
  }

}
resource "aws_instance" "mysql" {
    ami = local.ami_id
    instance_type = "t3.micro" 
    vpc_security_group_ids =[ local.mysql_sg_id ]
    subnet_id = local.database_subnet_ids
   # iam_instance_profile = ec2roletofetchssmparameter #this is the name we created in aws role
    
tags = merge (
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}-mysql"
    }
)

}
#terraform data nothing but null resource
resource "terraform_data" "mysql" {
    triggers_replace = [ #instance create ayyaka edi trigger avvali
        aws_instance.mysql.id
    ]
    provisioner "file" {
        source = "bootstarp.sh"
        destination = "/tmp/bootstarp.sh"
    }
        
   connection {
    type  = "ssh"
    user = "ec2-user"
    password = "DevOps321"
    host  = aws_instance.mysql.private_ip
    bastion_host        = "34.229.59.255"
    bastion_user        = "ec2-user"
    bastion_password    = "DevOps321"
  }
# for execution
  provisioner "remote-exec" {
    inline  = [
      "chmod +x /tmp/bootstarp.sh",
      "sudo sh /tmp/bootstarp.sh mysql"
    ]
  }

}
resource "aws_instance" "rabbitmq" {
    ami = local.ami_id
    instance_type = "t3.micro" 
    vpc_security_group_ids =[ local.rabbitmq_sg_id ]
    subnet_id = local.database_subnet_ids
    
tags = merge (
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}-rabbitmq"
    }
)

}
#terraform data nothing but null resource
resource "terraform_data" "rabbitmq" {
    triggers_replace = [ #instance create ayyaka edi trigger avvali
        aws_instance.rabbitmq.id
    ]
    provisioner "file" {
        source = "bootstarp.sh"
        destination = "/tmp/bootstarp.sh"
    }
        
   connection {
    type  = "ssh"
    user = "ec2-user"
    password = "DevOps321"
    host  = aws_instance.rabbitmq.private_ip
    bastion_host        = "34.229.59.255"
    bastion_user        = "ec2-user"
    bastion_password    = "DevOps321"
  }
# for execution
  provisioner "remote-exec" {
    inline  = [
      "chmod +x /tmp/bootstarp.sh",
      "sudo sh /tmp/bootstarp.sh rabbitmq"
    ]
  }

}