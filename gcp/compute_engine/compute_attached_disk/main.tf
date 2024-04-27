resource "google_compute_attached_disk" "CSC" {
    for_each = { for k, v in var.compute_attached_disk : v.default_service_name => v }
    instance = each.value.target_instance
    disk = each.value.target_disk
    project = each.value.target_project
    zone = each.value.zone
    device_name = each.value.device_name
    mode = each.value.mode
}