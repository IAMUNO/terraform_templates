# This resource is in beta, and should be used with the terraform-provider-google-beta provider.
resource "google_compute_network_attachment" "CSC" {
    for_each = { for k, v in var.compute_network_attachment : v.default_service_name => v }
    name = each.value.default_service_name
    connection_preference = each.value.connection_preference
    subnnetworks = each.value.subnnetworks
    region = each.value.region
}