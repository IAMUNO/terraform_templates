resource "google_container_registry" "CSC" {
    for_each = { for k, v in var.container_registry : v.default_service_name => v }
    location = each.value.location
    project = each.value.default_service_name
}