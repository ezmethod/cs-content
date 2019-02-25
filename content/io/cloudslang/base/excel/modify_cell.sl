#   (c) Copyright 2019 EntIT Software LLC, a Micro Focus company, L.P.
#   All rights reserved. This program and the accompanying materials
#   are made available under the terms of the Apache License v2.0 which accompany this distribution.
#
#   The Apache License is available at
#   http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
########################################################################################################################
#!!
#! @description: Modifies the specified cell with new value in an Excel document.
#!               XLS, XLSX and XLSM formats are supported.
#!
#! @input excel_file_name: The absolute path to the new Excel document.
#!                         Examples: c:\temp\test.xls
#! @input worksheet_name: The name of Excel worksheet
#!                        Optional
#! @input row_index: A list of row indexes.
#!                   Examples: 1:3, 10, 15:20,25
#!                   Optional
#! @input column_index: A list of column indexes.
#!                      Examples: 1:3, 10, 15:20,25
#!                      Optional
#! @input new_value: A comma delimited list of data to write to the specified cell. The size of the newValue list should
#!                   be the same as the size of columnIndex input.
#! @input column_delimiter: The delimiter used to separate the columns of the returnResult.
#!                          Default value: , (comma)
#!                          Optional
#!
#! @output return_result: This is the primary output. Returns the number of rows that were affected.
#! @output return_code: 0 if success, -1 otherwise.
#! @output exception: An error message in case there was an error while modifying the cell.
#!
#! @result SUCCESS: The cell data was modified successfully.
#! @result FAILURE: Failed to modify the cell data.
#!!#
########################################################################################################################

namespace: io.cloudslang.base.excel.actions

operation: 
  name: modify_cell
  
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
    - new_value    
    - newValue: 
        default: ${get('new_value', '')}  
        required: false 
        private: true 
    - column_delimiter:  
        required: false  
    - columnDelimiter: 
        default: ${get('column_delimiter', '')}  
        required: false 
        private: true 
    
  java_action: 
    gav: 'io.cloudslang.content:cs-excel:0.0.1-SNAPSHOT'
    class_name: 'io.cloudslang.content.excel.actions.ModifyCell'
    method_name: 'execute'
  
  outputs: 
    - return_result: ${get('returnResult', '')} 
    - return_code: ${get('returnCode', '')} 
    - exception: ${get('exception', '')} 
  
  results: 
    - SUCCESS: ${returnCode=='0'} 
    - FAILURE
