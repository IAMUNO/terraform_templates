output "compute_network_attachment" {
    value = {
        for k, v in google_compute_network_attachment.CSC : k => {
            id = v.id
        }
    }
}