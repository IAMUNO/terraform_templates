output "google_container_registry" {
    value = {
        for k, v in google_google_container_registry.CSC : k => {
            id = v.id
        }
    }
}