resource "google_compute_network_firewall_policy_rule" "CSC" {
    for_each = { for k, v in var.compute_network_firewall_policy_rule : v.default_service_name => v }
    rule_name = each.value.default_service_name
    action = each.value.action
    direction = each.value.direction
    firewall_policy = each.value.linked_firewall_policy
    priority = each.value.priority
    description = each.value.description
    disabled  = each.value.description
    enable_logging = each.value.enable_logging
    project =  each.value.target_project
    target_service_accounts = each.value.target_service_accounts

    dynamic "target_secure_tags" {
        for_each = length(each.value.target_secure_tags) != 0 ? [1] : []
        content {
            name = target_secure_tags.value.name
        }
    }

    match {
        dest_address_groups = each.value.match.dest_address_groups
        dest_fqdns = each.value.match.dest_fqdns
        dest_ip_ranges = each.value.match.dest_ip_ranges
        dest_region_codes = each.value.match.dest_region_codes
        dest_threat_intelligences = each.value.match.dest_threat_intelligences
        src_address_groups = each.value.match.src_address_groups
        src_fqdns = each.value.match.src_fqdns
        src_ip_ranges = each.value.match.src_ip_ranges
        src_region_codes = each.value.match.src_region_codes
        src_threat_intelligences = each.value.match.src_threat_intelligences

        layer4_configs {
            ip_protocol = each.value.match.ip_protocol
            ports = each.value.match.ports
        }

        dynamic "src_secure_tags" {
            for_each = length(each.value.match.src_secure_tags) != 0 ? [1] : []
            content {
                name = src_secure_tags.value.match.src_secure_tags
            }
        }
    }
}
