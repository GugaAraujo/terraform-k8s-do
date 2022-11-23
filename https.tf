resource "digitalocean_certificate" "certcom" {
  name       = "certcom"
  type       = "lets_encrypt"
  domains    = [var.domain_name]
  depends_on = [digitalocean_domain.domain]
}