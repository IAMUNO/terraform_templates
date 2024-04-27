output "compute_network_endpoint_group" {
    value = {
        for k, v in google_compute_network_endpoint_group.CSC : k => {
            id = v.id
        }
    }
}