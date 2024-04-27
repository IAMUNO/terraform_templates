output "compute_network_peering" {
    value = {
        for k, v in google_compute_network_peering.CSC : k => {
            id = v.id
        }
    }
}