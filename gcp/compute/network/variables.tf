variable "compute_network" {
    type = map(object({
      default_service_name = ""
    }))
    description = ""
    default = {
        "network1" = {
            "default_service_name" = ""
        }
    }
  
}