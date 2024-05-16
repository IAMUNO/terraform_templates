variable "compute_backend_service" {
    type = map(object({
        default_service_name = string # re
        
        affinity_cookie_ttl_sec = string # op
        backend = object({
            balancing_mode = string # UTILIZATION, RATE, CONNECTION
            capacity_scaler = string # op 
            group = string # re
            max_connections = string # op
            max_connections_per_instance = string # op
            max_connections_per_endpoint = string # op
            max_rate = string # op
            max_rate_per_instance = string # op
            max_rate_per_endpoint = string # op
            max_utilization = string # op
        })
        circuit_breakers = {
            max_requests_per_connection = string # op
            max_connections = string # op
            max_pending_requests = string # op
            max_requests = string # op
            max_retries = string # op
        }
        compression_mode = string # AUTOMATIC, DISABLED
        consistent_hash = object({
            ttl_sec = string # re
            ttl_nanos = string # op
            http_cookie_name = string # op
            http_cookie_path = string # op
            http_header_name = string # op
            minimum_ring_size = string # op
        })
        cdn_policy = object({
           = 
        })




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