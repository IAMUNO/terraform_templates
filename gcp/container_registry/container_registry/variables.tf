variable "container_registry" {
    type = map(object({
        default_service_name = string # re
        location = string # ASIA, EU, US
    }))
    description = ""
    default = {
        "container_registry1" = {
            "default_service_name" = "",
            "location" = ""
        }
    }
}


