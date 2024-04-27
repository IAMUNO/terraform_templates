variable "compute_network_peering_routes_config" {
    type = map(object({
        default_service_name = string # re
        enable_export_custom_routes = bool # re
        enable_import_custom_routes = bool # re
        target_primary_network = string # re
        target_project = string # op
    }))
    description = ""
    default = {
        "peering_route_config1" = {
            "default_service_name" = ""
            "enable_export_custom_routes" = false
            "enable_import_custom_routes" = false
            "target_primary_network" = ""
            "target_project" = ""
        }
    }
}