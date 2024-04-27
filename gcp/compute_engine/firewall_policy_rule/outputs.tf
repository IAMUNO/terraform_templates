output "compute_network_firewall_policy_rule" {
    value = {
        for k, v in google_compute_network_firewall_policy_rule.CSC : k => {
            id = v.id
        }
    }
}