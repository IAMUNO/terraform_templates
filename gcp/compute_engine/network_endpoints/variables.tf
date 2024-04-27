variable "compute_network_endpoints" {
    type = map(object({
        default_service_name = string # re
        linked_network_endpoint_group = string # re
        network_endpoints = map(object({
            instance = string # op
            port = string # op
            ip_address = string # re
        }))
        zone = string # op 
        target_project = string # op
    }))
    description = ""
    default = {
        "network_endpoints" = {
            "default_service_name" = ""
            "linked_network_endpoint_group" = ""
            "network_endpoints" = {}
            "zone" = ""
            "target_project" = ""
        }
    }
}