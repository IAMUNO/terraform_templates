resource "google_compute_network_firewall_policy" "CSC" {
    for_each = { for k, v in var.compute_network_firewall_policy : v.default_service_name => v }
    name = each.value.default_service_name
    description = each.value.description
    project = each.value.target_project
}