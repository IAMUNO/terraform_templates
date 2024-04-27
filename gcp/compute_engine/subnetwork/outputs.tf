output "compute_subnetwork" {
    value = {
        for k, v in google_compute_subnetwork.CSC : k => {
            id = v.id
        }
    }
}