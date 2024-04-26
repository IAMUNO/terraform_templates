variable "compute_network_firewall_policy" {
    type = map(object({
        default_service_name = string # re
        description = string # re
        target_project = string # re
    }))
    description = ""
    default = {
        "firewall_policy1" = {
            "default_service_name" = ""
            "description" = ""
            "target_project" = ""
        }
    }
}