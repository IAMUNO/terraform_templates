output "compute_network" {
    value = {
        for k, v in google_compute_network.CSC : k => {
            id = v.id
        }
    }
}