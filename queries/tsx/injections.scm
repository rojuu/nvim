; TODO: IF this is robust, could be made into a PR for https://github.com/nvim-treesitter/nvim-treesitter ?
(call_expression
  function: (instantiation_expression
	  (member_expression
      object: (identifier) @_name (#eq? @_name "styled")
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
            (#set! injection.language "styled"))
