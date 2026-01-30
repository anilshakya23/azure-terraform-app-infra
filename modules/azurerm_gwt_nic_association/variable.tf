variable "appgateway_nic" {
  type = map(object({
   ip_configuration_name = string
    nic_data_name = string
    resource_group_name = string
    backend_pool_data_name = string
  }))
}