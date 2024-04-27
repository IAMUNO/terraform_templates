resource "google_compute_network_endpoints" "CSC" {
    for_each = { for k, v in var.compute_network_endpoints : v.default_service_name => v }
    network_endpoint_group = each.value.linked_network_endpoint_group
    zone = each.value.zone
    project = each.value.target_project 
    dynamic "network_endpoints" {
        for_each = each.value.network_endpoints
        content {
            instance = network_endpoints.value.instance
            port = network_endpoints.value.port
            ip_address = network_endpoints.value.ip_address
        }
    }


}