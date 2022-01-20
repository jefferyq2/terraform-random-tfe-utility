locals {
  mitmproxy_http_port = 8080
  mitmproxy_user_data_script_base64_encoded = base64encode(templatefile(
    "${path.module}/templates/mitmproxy.sh.tpl",
    {
      ca_certificate_secret = tostring(var.mitmproxy_ca_certificate_secret)
      ca_private_key_secret = tostring(var.mitmproxy_ca_private_key_secret)
      http_port             = local.mitmproxy_http_port
    }
  ))

  squid_http_port = 3128
  squid_user_data_script_base64_encoded = base64encode(templatefile(
    "${path.module}/templates/squid.sh.tpl",
    { http_port = local.squid_http_port }
  ))
}
