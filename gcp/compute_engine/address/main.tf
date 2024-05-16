resource "google_compute_address" "CSC" {
    for_each = { for k, v in var.compute_address : v.default_service_name => v }
    name = each.value.default_service_name
    address = each.value.address
    address_type = each.value.address_type # INTERNAL, EXTERNAL
    purpose = each.value.purpose # GCE_ENDPOINT, SHARED_LOADBALANCER_VIP , VPC_PEERING , IPSEC_INTERCONNECT , PRIVATE_SERVICE_CONNECT
    network_tier = each.value.network_tier # PREMIUM, STANDARD
    subnetwork = each.value.target_subnetwork
    labels = each.value.labels # any
    network = each.value.target_network
    prefix_length = each.value.prefix_length
    ip_version = each.value.ip_version # IPV4, IPV6
    ipv6_endpoint_type = each.value.ipv6_endpoint_type # VM, NETLB
    region = each.value.region
    project = each.value.target_project
}