resource "digitalocean_domain" "domain" {
  name = var.domain_name
}

resource "digitalocean_record" "main_record" {
  depends_on = [data.kubernetes_service_v1.data_svc]
  domain = digitalocean_domain.domain.id
  type = "A"
  name = "@"
  value = data.kubernetes_service_v1.data_svc.status.0.load_balancer.0.ingress.0.ip
}