output "compute_attached_disk" {
    value = {
        for k, v in google_compute_attached_disk.CSC : k => {
            id = v.id
        }
    }
}