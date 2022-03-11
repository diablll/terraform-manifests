# Launch Template Resource
resource "aws_launch_template" "my_launch_template" {
  name = "my-launch-template"
  description = "My Launch template"
  image_id = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type

  vpc_security_group_ids = [ module.private_sg.security_group_id ]
  key_name = var.instance_keypair
  user_data = filebase64("${path.module}/app1-install.sh")
  ebs_optimized = true 
  #default_version = 1
  update_default_version = true 
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      #volume_size = 10      
      volume_size = 20 # LT Update Testing - Version 2 of LT              
      delete_on_termination = true
      volume_type = "gp2" # default  is gp2 
    }
   }
  monitoring {
    enabled = true
  }   
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "myasg"
    }
  }  
  
# Autoscaling Group Resource
resource "aws_autoscaling_group" "my_asg" {
  name_prefix = "myasg-"
  desired_capacity = 2
  max_size = 10
  min_size = 2
  vpc_zone_identifier = module.vpc.private_subnets
  target_group_arns = module.alb.target_group_arns
  health_check_type = "EC2"
  #health_check_grace_period = 300 # default is 300 seconds
  launch_template {
    id = aws_launch_template.my_launch_template.id 
    version = aws_launch_template.my_launch_template.latest_version
  }
  # Instance Refresh
  instance_refresh {
    strategy = "Rolling"
    preferences {
      # instance_warmup = 300 # Default behavior is to use the Auto Scaling Groups health check grace period value
      min_healthy_percentage = 50            
    }
    triggers = [ "desired_capacity" ] # You can add any argument from ASG here, if those has changes, ASG Instance Refresh will trigger   
  }
  tag {
    key                 = "Owners"
    value               = "Web-Team"
    propagate_at_launch = true
  }
}