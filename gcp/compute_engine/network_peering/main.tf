# 서로 각각 peering을 뚫어줘야함 
resource "google_compute_network_peering" "CSC" {
    for_each = { for k, v in var.compute_network_peering : v.default_service_name => v }
    name = each.value.default_service_name
    network = each.value.network
    peer_network = each.value.peer_network
}