resource "google_compute_network_endpoint_group" "CSC" {
    for_each = { for k, v in var.compute_network_endpoint_group : v.default_service_name => v }
    name = each.value.default_service_name
    network = each.value.target_network
    network_endpoint_type = each.value.network_endpoint_type
    subnetwork = each.value.target_subnetwork
    default_port = each.value.default_port
    zone = each.value.zone
    project = each.value.target_project
}