resource "google_compute_network_firewall_policy_association" "CSC" {
    for_each = { for k, v in var.compute_network_firewall_policy_association : v.default_service_name => v }
    name = each.value.default_service_name
    firewall_policy = each.value.target_firewall_policy
    attachment_target = each.value.attachment_target
}