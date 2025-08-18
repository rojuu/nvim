; TODO: IF this is robust, could be made into a PR for https://github.com/nvim-treesitter/nvim-treesitter ?
; styled.div<{ $props: type }>`<css>`
(call_expression
  function: (non_null_expression
    (instantiation_expression
	  (member_expression
        object: (identifier)
        property: (property_identifier))
        type_arguments: (type_arguments
          (object_type
            (property_signature
              name: (property_identifier)
              type: (type_annotation
                (predefined_type)))))))
            arguments: ((template_string) @injection.content
              (#offset! @injection.content 0 1 0 -1)
              (#set! injection.include-children)
              (#set! injection.language "styled")))
