output "compute_network_endpoint" {
    value = {
        for k, v in google_compute_network_endpoint.CSC : k => {
            id = v.id
        }
    }
}