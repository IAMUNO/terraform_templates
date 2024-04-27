variable "compute_network_attachment" {
    type = map(object({
        default_service_name = string # re
        connection_preference = string # re // ACCEPT_AUTOMATIC, ACCEPT_MANUAL, INVALID
        subnnetworks = list(string) # re
        region = string # re
    }))
    description = ""
    default = {
        "compute_network_attachment1" = {
            "default_service_name" = ""
            "connection_preference" = ""
            "subnnetworks" = []
            "region" = ""
        }
    }
}