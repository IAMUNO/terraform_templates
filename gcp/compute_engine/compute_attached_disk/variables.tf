variable "compute_attached_disk" {
    type = map(object({
        default_service_name = string # re
        target_instance = string # re
        target_disk = string # re
        target_project = string # op
        zone = string # op
        device_name = string # op
        mode = string # READ_ONLY, READ_WRITE
    }))
    description = ""
    default = {
        "attached_disk1" = {
            "default_service_name" = ""
            "target_instance" = ""
            "target_disk" = ""
            "target_project" = ""
            "zone" = ""
            "device_name" = ""
            "mode" = ""
        }
    }
}