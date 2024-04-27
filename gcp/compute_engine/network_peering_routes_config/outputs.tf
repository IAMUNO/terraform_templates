output "compute_network_peering_routes_config" {
    value = {
        for k, v in google_compute_network_peering_routes_config.CSC : k => {
            id = v.id
        }
    }
}