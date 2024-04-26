resource "google_compute_network" "CSC" {
    for_each = { for k, v in var.compute_network : v.default_service_name => v }
    name = each.value.default_service
    auto_create_subnetworks = each.value.enable_auto_create_subnetworks
    routing_mode = each.value.routing_mode
    mtu = each.value.mtu
    enable_ula_internal_ipv6 = each.value.enable_ula_internal_ipv6
    internal_ipv6_range =  each.value.internal_ipv6_range
    network_firewall_policy_enforcement_order = each.value.network_firewall_policy_enforcement_order
    project = each.value.project_id
    delete_default_routes_on_create = each.value.delete_default_routes_on_create
}