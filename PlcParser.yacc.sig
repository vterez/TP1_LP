signature PlcParser_TOKENS =
sig
type ('a,'b) token
type svalue
val UNDERLINE:  'a * 'a -> (svalue,'a) token
val BARRA_VERTICAL:  'a * 'a -> (svalue,'a) token
val VIRGULA:  'a * 'a -> (svalue,'a) token
val FECHA_CHAVE:  'a * 'a -> (svalue,'a) token
val ABRE_CHAVE:  'a * 'a -> (svalue,'a) token
val FECHA_PARENTESES:  'a * 'a -> (svalue,'a) token
val ABRE_PARENTESES:  'a * 'a -> (svalue,'a) token
val FECHA_COLCHETE:  'a * 'a -> (svalue,'a) token
val ABRE_COLCHETE:  'a * 'a -> (svalue,'a) token
val MENOR_IGUAL:  'a * 'a -> (svalue,'a) token
val MAIOR:  'a * 'a -> (svalue,'a) token
val MENOR:  'a * 'a -> (svalue,'a) token
val DIVIDIDO:  'a * 'a -> (svalue,'a) token
val VEZES:  'a * 'a -> (svalue,'a) token
val MAIS:  'a * 'a -> (svalue,'a) token
val DUPLO_E_COMERCIAL:  'a * 'a -> (svalue,'a) token
val MENOS_MAIOR:  'a * 'a -> (svalue,'a) token
val MENOS:  'a * 'a -> (svalue,'a) token
val EXCLAMACAO:  'a * 'a -> (svalue,'a) token
val DUPLO_DOIS_PONTOS:  'a * 'a -> (svalue,'a) token
val DOIS_PONTOS:  'a * 'a -> (svalue,'a) token
val DIFERENTE:  'a * 'a -> (svalue,'a) token
val IGUAL:  'a * 'a -> (svalue,'a) token
val PONTO_VIRGULA:  'a * 'a -> (svalue,'a) token
val INT:  'a * 'a -> (svalue,'a) token
val BOOL:  'a * 'a -> (svalue,'a) token
val NIL:  'a * 'a -> (svalue,'a) token
val FALSE:  'a * 'a -> (svalue,'a) token
val TRUE:  'a * 'a -> (svalue,'a) token
val END:  'a * 'a -> (svalue,'a) token
val FN:  'a * 'a -> (svalue,'a) token
val PRINT:  'a * 'a -> (svalue,'a) token
val ISE:  'a * 'a -> (svalue,'a) token
val TL:  'a * 'a -> (svalue,'a) token
val HD:  'a * 'a -> (svalue,'a) token
val WITH:  'a * 'a -> (svalue,'a) token
val MATCH:  'a * 'a -> (svalue,'a) token
val ELSE:  'a * 'a -> (svalue,'a) token
val THEN:  'a * 'a -> (svalue,'a) token
val IF:  'a * 'a -> (svalue,'a) token
val REC:  'a * 'a -> (svalue,'a) token
val FUN:  'a * 'a -> (svalue,'a) token
val VAR:  'a * 'a -> (svalue,'a) token
val EOF:  'a * 'a -> (svalue,'a) token
val ID: (string) *  'a * 'a -> (svalue,'a) token
val NUM: (int) *  'a * 'a -> (svalue,'a) token
end
signature PlcParser_LRVALS=
sig
structure Tokens : PlcParser_TOKENS
structure ParserData:PARSER_DATA
sharing type ParserData.Token.token = Tokens.token
sharing type ParserData.svalue = Tokens.svalue
end
