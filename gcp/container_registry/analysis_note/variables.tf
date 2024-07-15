variable "container_analysis_note" {
    type = map(object({
        default_service_name = string # re
        short_description = string
        long_description = string
        expiration_time = string
        hint_human_readable_name = string
        related_url = map(object({
            url = string
            label = string
        }))
    }))
    description = ""
    default = {
        "analysis_note1" = {
            "default_service_name" = "",
            "short_description" = "",
            "long_description" = "",
            "expiration_time" = "",
            "hint_human_readable_name" = "",
            "related_url" = {}
        }
    }
}


