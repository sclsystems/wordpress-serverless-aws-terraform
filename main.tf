module "ecs" {
  source = "./modules/ecs"

  wordpress_image = var.wordpress_image
  execution_role_arn = var.execution_role_arn
  aws_account_id = var.aws_account_id
  aws_region = var.aws_region
  database_host = ""
  database_name = ""
  database_password = ""
  database_username = ""
  efs_file_system_id = ""
  efs_id = ""
  load_balancer_target_group_arn = ""
  security_group_list = []
  subnet_list = []
}
