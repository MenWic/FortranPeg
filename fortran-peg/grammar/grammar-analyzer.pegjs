init
  = regla (nl regla)*

regla
  = nombre nl "=" nl choice nl ";"
  
choice
  = concat (nl "/" nl concat)*

concat
  = expression (_ expression)*

expression
  = parsingExpression [?+*]?

parsingExpression
  = nombre
  / string
  / range

string
	= ["] [^"]* ["]
    / ['] [^']* [']
    
range = "[" input_range+ "]"

input_range = [^[\]-] "-" [^[\]-]
			/ [^[\]]+

nombre "identificador"
  = [_a-z]i[_a-z0-9]i*

_ "espacios en blanco"
  = [ \t]*

nl "nueva linea"
  = [ \t\n\r]*