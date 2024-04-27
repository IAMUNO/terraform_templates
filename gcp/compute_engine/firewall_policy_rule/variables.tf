variable "compute_network_firewall_policy_rule" {
    type = map(object({
        default_service_name = string
        action = string # "allow", "deny", "goto_next"
        direction = string # INGRESS, EGRESS
        linked_firewall_policy = string
        priority = number # 0 and 2147483647
        match = object({
            dest_address_groups = string
            dest_fqdns = string 
            dest_ip_ranges = string
            dest_region_codes = string
            dest_threat_intelligences = string
            src_address_groups = string
            src_fqdns = string
            src_ip_ranges = string
            src_region_codes = string
            src_threat_intelligences = string
            ip_protocol = string
            ports = string
            src_secure_tags = string
        })
    }))
    description = ""
    default = {
        "firewall_policy1" = {
            "default_service_name" = ""
            "action" = ""
            "direction" = ""
            "linked_firewall_policy" = ""
            "priority" = ""
            "match" = {
                "dest_address_groups" = ""
                "dest_fqdns" = ""
                "dest_ip_ranges" = ""
                "dest_region_codes" = ""
                "dest_threat_intelligences" = ""
                "src_address_groups" = ""
                "src_fqdns" = ""
                "src_ip_ranges" = ""
                "src_region_codes" = ""
                "src_threat_intelligences" = ""
                "ip_protocol" = ""
                "ports" = ""
                "src_secure_tags" = ""
            }
        }
    }
}