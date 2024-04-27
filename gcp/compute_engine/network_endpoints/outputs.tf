output "compute_network_endpoints" {
    value = {
        for k, v in google_compute_network_endpoints.CSC : k => {
            id = v.id
        }
    }
}