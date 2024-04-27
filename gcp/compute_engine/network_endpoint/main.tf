resource "google_compute_network_endpoint" "CSC" {
    for_each = { for k, v in var.compute_network_endpoint : v.default_service_name => v }
    ip_address = each.value.ip_address
    network_endpoint_group = each.value.target_network_endpoint_group
    instance = each.value.target_instance
    port = each.value.port
    zone = each.value.zone
    project = each.value.target_project
}