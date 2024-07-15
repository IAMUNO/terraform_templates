resource "google_compute_vpn_gateway" "CSC" {
    for_each = { for k, v in var.compute_vpn_gateway : v.default_service_name => v }
    name = each.value.default_service_name
    network = each.value.target_network
}