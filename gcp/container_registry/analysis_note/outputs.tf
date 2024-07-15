output "analysis_note" {
    value = {
        for k, v in google_container_analysis_note.CSC : k => {
            id = v.id
        }
    }
}