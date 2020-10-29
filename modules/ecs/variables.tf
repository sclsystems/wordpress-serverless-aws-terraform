variable "database_password" {
  type = string
}

variable "database_username" {
  type = string
}

variable "database_host" {
  type = string
}

variable "database_name" {
  type = string
}

variable "load_balancer_target_group_arn" {
  type = string
}

variable "efs_file_system_id" {
  type = string
}

variable "execution_role_arn" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "wordpress_image" {
  type = string
}

variable "aws_account_id" {
  type = string
}

variable "efs_id" {
  type = string
}

variable "subnet_list" {
  type = list(string)
}

variable "security_group_list" {
  type = list(string)
}
