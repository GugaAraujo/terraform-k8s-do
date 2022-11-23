output "kube-config" {
  value = digitalocean_kubernetes_cluster.k8s.kube_config.0.raw_config
  sensitive = true
}

output "domain" {
  value = digitalocean_record.main_record.fqdn
}

output "public-ip" {
  value = digitalocean_record.main_record.value
}

output "load-balancer" {
  value = digitalocean_loadbalancer.this.ip
}

output "database_name" {
  value = digitalocean_database_db.database.name
}

output "database_username" {
  value = digitalocean_database_user.username.name
}

output "database_password" {
  value     = digitalocean_database_user.username.password
  sensitive = true
}

output "database_uri" {
  value     = digitalocean_database_cluster.mysql.uri
  sensitive = true
}

output "digitalocean_vpc" {
  value = [digitalocean_vpc.vpc_com.ip_range,
    digitalocean_vpc.vpc_com.description
  ]
}