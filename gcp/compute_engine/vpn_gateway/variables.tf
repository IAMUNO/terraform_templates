variable "compute_vpn_gateway" {
    type = map(object({
        default_service_name = string # re
        target_network = string # re

    }))
    description = ""
    default = {
        "vpn_gateway1" = {
            "default_service_name" = ""
            "target_network" = ""
        }
    }
}
