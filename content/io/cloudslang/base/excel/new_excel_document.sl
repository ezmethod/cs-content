########################################################################################################################
#!!
#! @description: Creates a blank Excel spreadsheet document. The format of the document
#! (XLS or XLSX) depends on the extension used by the file.
#!
#! @input excel_file_name: The absolute path to the new Excel document.
#! Examples: c:\temp\test.xls
#! @input worksheet_names: A delimited list of names that will be created as worksheets in the document. 
#! Default value:
#!                         Sheet1,Sheet2,Sheet3.
#!                         Optional
#! @input delimiter: The character used to delimit worksheet names.
#! Default value: comma (,)
#!                   Optional
#!
#! @output return_result: This is the primary output. Returns a success or failure message.
#! @output return_code: 0 if success, -1 otherwise.
#! @output exception: An error message in case there was an error creating the file.
#!
#! @result SUCCESS: A new Excel document is created successfully.
#! @result FAILURE: Failed to create a new Excel document.
#!!#
########################################################################################################################

namespace: io.cloudslang.base.excel.actions

operation: 
  name: new_excel_document
  
  inputs: 
    - excel_file_name    
    - excelFileName: 
        default: ${get('excel_file_name', '')}  
        required: false 
        private: true 
    - worksheet_names:  
        required: false  
    - worksheetNames: 
        default: ${get('worksheet_names', '')}  
        required: false 
        private: true 
    - delimiter:  
        required: false  
    
  java_action: 
    gav: 'io.cloudslang.content:cs-excel:0.0.1-SNAPSHOT'
    class_name: 'io.cloudslang.content.excel.actions.NewExcelDocument'
    method_name: 'execute'
  
  outputs: 
    - return_result: ${get('returnResult', '')} 
    - return_code: ${get('returnCode', '')} 
    - exception: ${get('exception', '')} 
  
  results: 
    - SUCCESS: ${returnCode=='0'} 
    - FAILURE
