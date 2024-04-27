output "compute_autoscaler" {
    value = {
        for k, v in google_compute_autoscaler.CSC : k => {
            id = v.id
        }
    }
}