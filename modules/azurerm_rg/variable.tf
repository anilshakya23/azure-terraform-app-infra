variable "rgs" {
  type = map(object({
    rg_name  = string
    location = string
  }))

}