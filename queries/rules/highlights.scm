; Keywords
;---------

"rules_version" @keyword
"service" @keyword
"function" @keyword.function
"match" @keyword
"allow" @keyword
"if" @keyword.control.conditional
"let" @keyword.storage.type
"return" @keyword.control.return
"in" @keyword.operator
"is" @keyword.operator

; Operators
;----------

[
  "="
  "=="
  "!="
  "<"
  "<="
  ">"
  ">="
  "+"
  "-"
  "*"
  "/"
  "%"
  "&&"
  "||"
  "!"
  "?"
  ":"
] @operator

; Punctuation
;------------

[
  ";"
  ","
  "."
] @punctuation.delimiter

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

; Literals
;---------

(string) @string
(int) @constant.numeric.integer
(float) @constant.numeric.float
(boolean) @constant.builtin
(null) @constant.builtin
(path) @string.special.path

; Identifiers
;------------

(identifier) @variable

(service_name_identifier) @variable.parameter
(path_identifier) @variable.parameter

; Function and Match declarations
;--------------------------------

(function_declaration
  name: (identifier) @function)

; Corrected match_declaration highlighting for path components
(match_declaration
  path: (match_path_parameter
    (path_string
      path: (path_identifier) @variable.parameter)))

(match_declaration
  path: (match_path_parameter
    (path_capture_string
      value: (identifier) @variable.parameter)))

(match_declaration
  path: (match_path_parameter
    (path_capture_group_string
      value: (identifier) @variable.parameter)))

(allow_declaration
  operation: (allow_operation_literal) @keyword.operator)

; Function Calls
;---------------

(function_call_expression
  name: (identifier) @function.call)

; Comments
;---------

(comment) @comment
