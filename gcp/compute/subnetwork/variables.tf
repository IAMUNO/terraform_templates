variable "compute_subnetwork" {
    type = map(object({
        default_service_name = string # re
        ip_cidr_range = string # re
        target_network = string # re
        purpose = string # op // PRIVATE_RFC_1918(def), REGIONAL_MANAGED_PROXY, GLOBAL_MANAGED_PROXY, PRIVATE_SERVICE_CONNECT or PRIVATE_NAT
        role = string # op // ACTIVE or BACKUP
        secondary_ip_range = object({
            enable_secondary_ip_range = bool
            range_name = string # op
            ip_cidr_range = string # op
        })
        private_ip_google_access = string # op
        private_ipv6_google_access = string # op
        region = string # op
        log_config = object({
            enable_log_config = bool
            aggregation_interval = string # op // INTERVAL_5_SEC(def), INTERVAL_30_SEC, INTERVAL_1_MIN, INTERVAL_5_MIN, INTERVAL_10_MIN, INTERVAL_15_MIN
            flow_sampling = string # op
            metadata = string # op // EXCLUDE_ALL_METADATA, INCLUDE_ALL_METADATA(def), CUSTOM_METADATA
            metadata_fields = string # op
        })
        stack_type = string # op // IPV4_ONLY, IPV4_IPV6
        ipv6_access_type = string # op // EXTERNAL, INTERNAL
        external_ipv6_prefix = string # op
        target_project = string # op
    }))
    description = ""
    default = {
        "subnetwork1" = {
            "default_service_name" = ""
            "ip_cidr_range" = ""
            "target_network" = ""
            "purpose" = ""
            "role" = ""
            "secondary_ip_range" = {
                "enable_secondary_ip_range" = false
                "range_name" = ""
                "ip_cidr_range" = ""
            }
            "private_ip_google_access" = ""
            "private_ipv6_google_access" = ""
            "region" = ""
            "log_config" = {
                "enable_log_config" = false
                "aggregation_interval" = ""
                "flow_sampling" = ""
                "metadata" = ""
                "metadata_fields" = ""
            }
            "stack_type" = ""
            "ipv6_access_type" = ""
            "external_ipv6_prefix" = ""
            "target_project" = ""
        }
    }
}


