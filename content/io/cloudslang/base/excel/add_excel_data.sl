########################################################################################################################
#!!
#! @description: Adds rows of data to an Excel document. This operation can be used to add/insert/update data to worksheets and documents. 
#!               XLS, XLSX and XLSM formats are supported. 
#!
#! @input excel_file_name: The absolute path to the new Excel document.
#! Examples: c:\temp\test.xls
#! @input worksheet_name: The name of Excel worksheet
#!                        Optional
#! @input header_data: A delimited list of column names. If left blank, the document will not have a header for the
#!                     data.
#!                     Optional
#! @input row_data: A delimited list of data.
#! @input row_index: A list of row indexes.
#! Examples: 1:3, 10, 15:20,25
#! Default Value: from the index of the first row 
#!                   to the index of the last row in the Excel worksheet.
#!                   Optional
#! @input column_index: A list of column indexes.
#! Examples: 1:3, 10, 15:20,25
#! Default value: from 0 to the index of the
#!                      last column in the Excel worksheet.
#!                      Optional
#! @input row_delimiter: The delimiter used to separate the rows of the returnResult.
#! Default value: | (pipe)
#!                       Optional
#! @input column_delimiter: The delimiter used to separate the columns of the returnResult.
#! Default value: , (comma)
#!                          Optional
#! @input overwrite_data: True if existing data should be overwritten.
#! Default value: false
#!                        Optional
#!
#! @output return_result: This is the primary output. Returns the number of rows that were added.
#! @output return_code: 0 if success, -1 otherwise.
#! @output exception: An error message in case there was an error adding excel data.
#!
#! @result SUCCESS: One or more rows of data were added successfully.
#! @result FAILURE: Failed to add rows of data to the Excel document.
#!!#
########################################################################################################################

namespace: io.cloudslang.base.excel.actions

operation: 
  name: add_excel_data
  
  inputs: 
    - excel_file_name    
    - excelFileName: 
        default: ${get('excel_file_name', '')}  
        required: false 
        private: true 
    - worksheet_name:  
        required: false  
    - worksheetName: 
        default: ${get('worksheet_name', '')}  
        required: false 
        private: true 
    - header_data:  
        required: false  
    - headerData: 
        default: ${get('header_data', '')}  
        required: false 
        private: true 
    - row_data    
    - rowData: 
        default: ${get('row_data', '')}  
        required: false 
        private: true 
    - row_index:  
        required: false  
    - rowIndex: 
        default: ${get('row_index', '')}  
        required: false 
        private: true 
    - column_index:  
        required: false  
    - columnIndex: 
        default: ${get('column_index', '')}  
        required: false 
        private: true 
    - row_delimiter:  
        required: false  
    - rowDelimiter: 
        default: ${get('row_delimiter', '')}  
        required: false 
        private: true 
    - column_delimiter:  
        required: false  
    - columnDelimiter: 
        default: ${get('column_delimiter', '')}  
        required: false 
        private: true 
    - overwrite_data:  
        required: false  
    - overwriteData: 
        default: ${get('overwrite_data', '')}  
        required: false 
        private: true 
    
  java_action: 
    gav: 'io.cloudslang.content:cs-excel:0.0.1-SNAPSHOT'
    class_name: 'io.cloudslang.content.excel.actions.AddExcelData'
    method_name: 'execute'
  
  outputs: 
    - return_result: ${get('returnResult', '')} 
    - return_code: ${get('returnCode', '')} 
    - exception: ${get('exception', '')} 
  
  results: 
    - SUCCESS: ${returnCode=='0'} 
    - FAILURE
