locals {
  container_name = "wordpress"
  efs_volume_name = "wordpress-efs"
}

resource "aws_ecs_cluster" "wordpress_cluster" {
  name = "wordpress"
}

resource "aws_ecs_service" "wordpress_service" {
  name = "site"
  cluster = aws_ecs_cluster.wordpress_cluster.id
  task_definition = aws_ecs_task_definition.wordpress_task_definition.arn
  desired_count = 2

  ordered_placement_strategy {
    type = "binpack"
    field = "cpu"
  }

  load_balancer {
    target_group_arn = var.load_balancer_target_group_arn
    container_name = local.container_name
    container_port = 80
  }

  network_configuration {
    subnets = var.subnet_list
    security_groups = var.security_group_list
    assign_public_ip = false
  }
}

resource "aws_ecs_task_definition" "wordpress_task_definition" {
  family = "service"
  container_definitions = templatefile("../config/task-definitions/site.tmpl.json", {
    aws_region = var.aws_region
    execution_role_arn = var.execution_role_arn
    database_host = var.database_host
    database_name = var.database_name
    database_password = var.database_password
    database_username = var.database_username
    efs_volume_name = local.efs_volume_name
    aws_account_id = var.aws_account_id
    efs_id = var.efs_id
    container_name = local.container_name
  })

  volume {
    name = local.efs_volume_name

    efs_volume_configuration {
      file_system_id = var.efs_file_system_id
      root_directory = "/"
      transit_encryption = "ENABLED"
      transit_encryption_port = 2999
    }
  }
}
