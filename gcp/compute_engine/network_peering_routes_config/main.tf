# 서로 각각 peering을 뚫어줘야함 
resource "google_compute_network_peering_routes_config" "CSC" {
    for_each = { for k, v in var.compute_network_peering_routes_config : v.default_service_name => v }
    peering = each.value.default_service_name
    export_custom_routes = each.value.enable_export_custom_routes
    import_custom_routes = each.value.enable_import_custom_routes
    network = each.value.target_primary_network
    project = each.value.target_project
}