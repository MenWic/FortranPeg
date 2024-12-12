gramatica
  = regla+ nl

regla
  = nl identificador nl string? nl "=" _ eleccion nl (_";"_)?
  / single_comment nl
  / multi_line_comment nl
  
eleccion
  = concatenation (nl "/" nl concatenation)*

concatenation
  = pluck (_ pluck)*

pluck
  = "@"? _ label

label
  = (identificador _ ":")? _ positivo

positivo
  = "&"? negativo

negativo
  = "!"? expression

expression
    = "$"? _ parsingExpression _ quantifier? _ single_comment?

quantifier
  = [?+*]
  / "|" _ (number / identificador) _ "|"
  / "|" _ (number / identificador)? _ ".." _ (number / identificador)? _ "|"
  / "|" _ (number / identificador)? _ "," _ eleccion _ "|"
  / "|" _ (number / identificador)? _ ".." _ (number / identificador)? _ "," _ eleccion _ "|"

parsingExpression
  = identificador
  / string "i"?
  / range "i"?
  / group
  / "."

group
  = "(" _ eleccion _ ")"

string
	= ["] [^"]* ["]
    / ['] [^']* [']
    
range = "[" input_range+ "]"

input_range = [^[\]-] "-" [^[\]-]
			/ [^[\]]+

identificador "identificador"
  = [_a-z]i[_a-z0-9]i*

_ "espacios en blanco"
  = [ \t]*

nl "nueva linea"
  = [ \t\n\r]*

number
  = [0-9]+

single_comment "comentario"
  = "//"  [^\n]*

multi_line_comment
  = "/*" (!"*/" .)* "*/"