package dbio.sample

import com.hiug.libs.db.bcp.CSV2BCPloader
import com.hiug.libs.file.*

class TemplateController {

    static allowedMethods = [save: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = 10
        [documentInstanceList: Template.list(params), documentInstanceTotal: Template.count()]
    }

    def add() {
    }

    def upload() {
        def file = request.getFile('file')
        if(file.empty) {
            flash.message = "File cannot be empty"
        } else {
            def documentInstance = new Template()
            documentInstance.fileName = file.originalFilename
            documentInstance.fullPath = grailsApplication.config.uploadFolder + documentInstance.fileName
            documentInstance.uploadStatus = "Success"
            documentInstance.rowCount = 1
            def fileWritten = new File(documentInstance.fullPath)
            file.transferTo(fileWritten)
            documentInstance.save()
            
            def numberFormatColumns = new HashMap<String,String>()
            numberFormatColumns.put("C", "yyyy-mm-dd")
            
            def csvFile = new File(documentInstance.fullPath + ".csv")
            def converter = new XLS2CSVConverter("vb_csv2xlsx", "C:/tmp_DB_IO_Sample", numberFormatColumns, null)
            def loader = new CSV2BCPloader(csvFile, "[personal_db_test]", "[dbo].[contact]")
            
            converter.setDeleteFileAfterConvert(false)
            converter.convert(fileWritten, csvFile)
            
            UTF8toISO88591encoder.encode(documentInstance.fullPath + ".csv")
            
            loader.loadDataFile()
            
            flash.message = "Plantilla cargada correctamente"
        }
        redirect (action:'list')
    }

    def download(Template documentInstance) {
//        Template documentInstance = Template.get(id)
        if ( documentInstance == null) {
            flash.message = "Template not found."
            redirect (action:'list')
        } else {
            response.setContentType("APPLICATION/OCTET-STREAM")
            response.setHeader("Content-Disposition", "Attachment;Filename=\"${documentInstance.fileName}\"")

            def file = new File(documentInstance.fullPath)
            def fileInputStream = new FileInputStream(file)
            def outputStream = response.getOutputStream()

            byte[] buffer = new byte[4096];
            int len;
            while ((len = fileInputStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, len);
            }

            outputStream.flush()
            outputStream.close()
            fileInputStream.close()
        }
    }
}
