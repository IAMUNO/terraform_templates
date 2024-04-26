resource "google_compute_subnetwork" "CSC" {
    for_each = { for k, v in var.compute_subnetwork : v.default_service_name => v }
    name = each.value.default_service_name
    ip_cidr_range = each.value.ip_cidr_range
    network = each.value.target_network

    purpose = each.value.purpose 
    role = each.value.purpose == "REGIONAL_MANAGED_PROXY" ? each.value.role : null

    dynamic "secondary_ip_range" {
        for_each = each.value.secondary_ip_range.enable_secondary_ip_range == true ? [1] : []
        content {
            range_name = secondary_ip_range.value.secondary_ip_range.range_name
            ip_cidr_range = secondary_ip_range.value.secondary_ip_range.ip_cidr_range
        }
    }

    private_ip_google_access = each.value.private_ip_google_access 
    private_ipv6_google_access = each.value.private_ipv6_google_access

    region = each.value.region

    dynamic "log_config" { 
        for_each = each.value.log_config.enable_log_config == true ? [1] : []
        content {
            aggregation_interval = log_config.value.log_config.aggregation_interval
            flow_sampling = log_config.value.log_config.flow_sampling
            metadata = log_config.value.log_config.metadata
            metadata_fields = log_config.value.log_config.metadata_fields
        }
    }
    stack_type = each.value.stack_type
    ipv6_access_type = each.value.ipv6_access_type
    external_ipv6_prefix = each.value.external_ipv6_prefix
    project = each.value.target_project








}