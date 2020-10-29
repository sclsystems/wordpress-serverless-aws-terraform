# Wordpress Serverless AWS Terraform

Complete Serverless AWS Wordpress

## Wordpress Image

https://hub.docker.com/_/WordPress

## Todo

1. Setup ECS Cluster and Task Definition
2. Setup new VPC using VPC module
3. Setup EFS File System
4. Setup Serverless Database RDS
5. Setup Load Balancer and tie to ECS
6. Setup Bastion Host with access to RDS and EFS
7. AWS Backup Setup for EFS and RDS

## Resources

- https://medium.com/@cmani/deploying-wordpress-on-aws-fargate-with-amazon-efs-file-system-eb7a36c22465
- https://github.com/cmanikandan/fargate-efs-wordpress/blob/master/wordpress-fargate-efs-taskdefinition.json
- https://aws.amazon.com/blogs/storage/recover-amazon-efs-files-and-folders-with-aws-backup/
