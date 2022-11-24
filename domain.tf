resource "digitalocean_domain" "domain" {
  name = var.domain_name
}

resource "digitalocean_record" "CNAME" {
  domain = digitalocean_domain.domain.id
  type   = "CNAME"
  name   = "www"
  value  = "@"
}
