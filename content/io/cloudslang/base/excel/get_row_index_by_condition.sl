########################################################################################################################
#!!
#! @description: Retrieves row indexes if the row satisfies the specified condition in an Excel document.
#!               XLS, XLSX and XLSM formats are supported.
#!
#! @input excel_file_name: The absolute path to the new Excel document.
#! Examples: c:\temp\test.xls
#! @input worksheet_name: The name of Excel worksheet
#!                        Optional
#! @input has_header: If Yes, then the first row of the document is expected to be the header row. 
#! Valid values: yes,
#!                    no
#! Default value: Yes
#!                    Optional
#! @input first_row_index: The index of the first row in the Excel worksheet, including the header row.
#! Default value: 0
#!                         Optional
#! @input column_indexto_query: The column index to search in.
#! @input operator: operator - The math operators. 
#! Valid values: ==, != for string comparison; ==, !=, <,<=,>,>= for
#!                  numeric comparison.
#! Default vaue: ==
#!                  Optional
#! @input value: The value to search in the specified column. If left blank, it means an empty value.
#!               Optional
#!
#! @output return_result: This is the primary result. Return a list of row indexes that satisfied the specified
#!                        condition.
#! @output return_code: 0 if success, -1 otherwise.
#! @output exception: An error message in case there was an error while retrieving the row data.
#! @output rows_count: The number of the row indexes returned.
#!
#! @result SUCCESS: The row indexes were retrieved successfully.
#! @result FAILURE: Failed to retrieve the row indexes.
#!!#
########################################################################################################################

namespace: io.cloudslang.base.excel.actions

operation: 
  name: get_row_index_by_condition
  
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
    - has_header:  
        required: false  
    - hasHeader: 
        default: ${get('has_header', '')}  
        required: false 
        private: true 
    - first_row_index:  
        required: false  
    - firstRowIndex: 
        default: ${get('first_row_index', '')}  
        required: false 
        private: true 
    - column_indexto_query    
    - columnIndextoQuery: 
        default: ${get('column_indexto_query', '')}  
        required: false 
        private: true 
    - operator:  
        required: false  
    - value:  
        required: false  
    
  java_action: 
    gav: 'io.cloudslang.content:cs-excel:0.0.1-SNAPSHOT'
    class_name: 'io.cloudslang.content.excel.actions.GetRowIndexByCondition'
    method_name: 'execute'
  
  outputs: 
    - return_result: ${get('returnResult', '')} 
    - return_code: ${get('returnCode', '')} 
    - exception: ${get('exception', '')} 
    - rows_count: ${get('rowsCount', '')} 
  
  results: 
    - SUCCESS: ${returnCode=='0'} 
    - FAILURE
