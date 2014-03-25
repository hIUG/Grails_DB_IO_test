package dbio.sample

class Template {
    String fileName
    String fullPath
    Date uploadDate = new Date()
    Integer rowCount
    String uploadStatus

    static constraints = {
        fileName(blank:false,nullable:false)
        fullPath(blank:false,nullable:false)
        rowCount(blank:false,nullable:false)
        uploadStatus(blank:false,nullable:false)
    }
}
