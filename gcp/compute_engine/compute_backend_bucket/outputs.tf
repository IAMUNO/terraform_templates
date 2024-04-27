output "compute_backend_bucket" {
    value = {
        for k, v in google_compute_backend_bucket.CSC : k => {
            id = v.id
        }
    }
}