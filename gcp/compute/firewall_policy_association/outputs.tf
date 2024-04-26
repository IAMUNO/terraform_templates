output "compute_network_firewall_policy_association" {
    value = {
        for k, v in google_compute_network_firewall_policy_association.CSC : k => {
            id = v.id
        }
    }
}