output "alb_dns" {
  value = module.compute.alb_dns
}

output "rds_endpoint" {
  value = module.data_layer.rds_endpoint
}

output "redis_endpoint" {
  value = module.data_layer.redis_endpoint
}

output "s3_bucket" {
  value = module.data_layer.s3_bucket
}