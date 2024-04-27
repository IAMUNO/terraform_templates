output "compute_network_firewall_policy" {
    value = {
        for k, v in google_compute_network_firewall_policy.CSC : k => {
            id = v.id
        }
    }
}