resource "digitalocean_loadbalancer" "this" {
  name = "load-balancer"
  region = var.project_region
  droplet_ids = [digitalocean_kubernetes_cluster.k8s.node_pool.0.nodes[0].droplet_id]

  forwarding_rule {
    entry_port       = 443
    entry_protocol   = "https"
    target_port     = 80
    target_protocol = "http"
    certificate_name = digitalocean_certificate.certcom.id
  }

  healthcheck {
    port     = 80
    protocol = "tcp"
  }
  redirect_http_to_https = true
}
