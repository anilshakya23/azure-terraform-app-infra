variable "lbs" {
  type = map(object({
    lb_name             = string
    location            = string
    resource_group_name = string
    ip_confi_name       = string
    lb_probe_name       = string
    backend_pool_name   = string
    pip-lb-data         = string
    frontend_ip_configuration = object({
      frontend_ip_name = string
    })
  }))
}
