variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t3.nano"
}

variable "ami_filter" {
    description = "Name filter and owner of AMI"

    type = object({
      name = string
      owner = string
    })

    default = {
      name  = "bitnami-tomcat-*-x86_64-hvm-ebs-nami"
      owner = "979382823631" # Bitnami
    }

}


variable "environment" {
  description = "Development Environment"
  
  type = object({
    name           = string
    network_prefix = string
  })

  default = {
    name = "dev"
    network_prefix = "10.0"
  }

}

/*module "blog_autoscaling" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "6.5.2"

  # Autoscaling group
  name = "blog"
  min_size = 1
  max_size = 2

  vpc_zone_identifier =  module.blog_vpc.public_subnets
  target_group_arns   = module.blog_alb.target_group_arns
  security_groups = [module.blog_sg.security_group_id]

  image_id           = data.aws_ami.app_ami.id
  instance_type = var.instance_type

}*/

