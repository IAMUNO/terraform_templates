variable "compute_network_firewall_policy_association" {
    type = map(object({
        default_service_name = string # re
        target_firewall_policy = string # re
        attachment_target = string # re
    }))
    description = ""
    default = {
        "firewall_policy1" = {
            "default_service_name" = ""
            "target_firewall_policy" = ""
            "attachment_target" = ""
        }
    }
}