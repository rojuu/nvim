; Scopes
;-------

[
  (service_declaration) @local.scope
  (function_declaration) @local.scope
  (match_declaration) @local.scope
]

; Definitions
;------------

(function_declaration
  name: (identifier) @local.definition.function)

(function_argument
  arg: (identifier) @local.definition.parameter)

(let_declaration
  name: (identifier) @local.definition.variable)

; path capture variables
(path_capture_string
  value: (identifier) @local.definition.variable)

(path_capture_group_string
  value: (identifier) @local.definition.variable)

; References
;------------

(identifier) @local.reference
