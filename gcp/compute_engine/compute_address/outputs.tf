output "compute_address" {
    value = {
        for k, v in google_compute_address.CSC : k => {
            id = v.id
        }
    }
}