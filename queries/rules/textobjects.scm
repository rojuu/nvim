; Functions
;----------

(function_declaration
  body: (function_body) @function.inside) @function.around

; Matches
;--------

(match_declaration
  body: (_) @block.inside) @block.around

; Lists
;------

(list
  (_) @element.around)

; Maps
;-----

(entry
  (_) @entry.inside) @entry.around

; Comments
;---------

(comment) @comment.inside
(comment)+ @comment.around
