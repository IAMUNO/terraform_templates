variable "compute_backend_service" {
    type = map(object({
        default_service_name = string # re
        address = string # op
        address_type = string # INTERNAL, EXTERNAL
        purpose = string # op // GCE_ENDPOINT, SHARED_LOADBALANCER_VIP , VPC_PEERING , IPSEC_INTERCONNECT , PRIVATE_SERVICE_CONNECT
        network_tier = string # op // PREMIUM, STANDARD
        target_subnetwork = string # op
        labels = any # {key:value}
        target_network = string # op
        prefix_length = string # op
        ip_version = string # op // IPV4, IPV6
        ipv6_endpoint_type = string # op // VM, NETLB
        region = string # op
        target_project = string # op
    }))
    description = ""
    default = {
        "peering1" = {
            "default_service_name" = ""
            "address" = ""
            "address_type" = ""
            "purpose" = ""
            "network_tier" = ""
            "target_subnetwork" = ""
            "labels" = {}
            "target_network" = ""
            "prefix_length" = ""
            "ip_version" = ""
            "ipv6_endpoint_type" = ""
            "region" = ""
            "target_project" = ""
        }
    }
}