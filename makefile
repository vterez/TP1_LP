all:
	ml-lex PlcLexer.lex
	ml-yacc PlcParser.yacc

run:
	sml testParser.sml