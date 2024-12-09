gramatica
  = regla (nl regla)*

regla
  = identificador nl "=" nl eleccion nl ";"
  
eleccion
  = concatenation (nl "/" nl concatenation)*

concatenation
  = expression (_ expression)*

expression
  = parsingExpression [?+*]?

parsingExpression
  = identificador
  / string
  / range
  / "(" _ eleccion _ ")"

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