variable "compute_network_endpoint" {
    type = map(object({
        default_service_name = string # re
        ip_address = string # re
        target_network_endpoint_group = string # re
        target_instance = string # op
        port = string # op // port is required unless the Network Endpoint Group is created with the type of GCE_VM_IP
        zone = string # op 
        target_project = string # op
    }))
    description = ""
    default = {
        "peering_route_config1" = {
            "default_service_name" = ""
            "ip_address" = ""
            "target_network_endpoint_group" = ""
            "target_instance" = ""
            "port" = ""
            "zone" = ""
            "target_project" = ""
        }
    }
}