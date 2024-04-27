variable "compute_network_peering" {
    type = map(object({
        default_service_name = string # re
        network = string # re
        peer_network = string # re
    }))
    description = ""
    default = {
        "peering1" = {
            "default_service_name" = ""
            "network" = ""
            "peer_network" = ""
        }
    }
}