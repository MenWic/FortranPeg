grammar
  = rule (nl rule)*

rule
  = name nl "=" _ choice nl ";"
  
choice
  = concatenation (nl "/" nl concatenation)*

concatenation
  = expression (_ expression)*

expression
  = parsingExpression [?+*]?

parsingExpression
  = name
  / string
  / range

string
	= ["] [^"]* ["]
    / ['] [^']* [']
    
range = "[" input_range+ "]"

input_range = [^[\]-] "-" [^[\]-]
			/ [^[\]]+

name "identificador"
  = [_a-z]i[_a-z0-9]i*

_ "espacios en blanco"
  = [ \t]*

nl "nueva linea"
  = [ \t\n\r]*