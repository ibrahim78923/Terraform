resource "tls_private_key" "self_signed" {
  count = var.certificate_arn == null ? 1 : 0

  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "tls_self_signed_cert" "self_signed" {
  count = var.certificate_arn == null ? 1 : 0

  private_key_pem = tls_private_key.self_signed[0].private_key_pem

  subject {
    common_name = var.certificate_domain_name
  }

  validity_period_hours = 8760

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}

resource "aws_acm_certificate" "self_signed" {
  count = var.certificate_arn == null ? 1 : 0

  private_key      = tls_private_key.self_signed[0].private_key_pem
  certificate_body = tls_self_signed_cert.self_signed[0].cert_pem

  tags = {
    Name = "${var.alb_name}-self-signed"
  }
}

locals {
  listener_certificate_arn = coalesce(
    var.certificate_arn,
    try(aws_acm_certificate.self_signed[0].arn, null)
  )
}
