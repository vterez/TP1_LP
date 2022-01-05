(* Plc Lexer *)

(* User declarations *)

open Tokens
type pos = int
type slvalue = Tokens.svalue
type ('a,'b) token = ('a,'b) Tokens.token
type lexresult = (slvalue, pos)token

val lineNumber = ref 0
val pos = ref 0

(* Get the current line being read. *)
fun getLineAsString() =
    let
        val lineNum = !lineNumber
    in
        Int.toString lineNum
    end

exception NoMatch;
(* A function to print a message error on the screen. *)
fun error (e,l : int,_) = let val i = TextIO.output (TextIO.stdOut, String.concat[
	"line ", (getLineAsString()), ": ", e, "\n"
      ]); val ex = NoMatch in raise ex end;

(* Define what to do when the end of the file is reached. *)
fun eof () = Tokens.EOF(0,0)

(* Initialize the lexer. *)
fun init() = (lineNumber := 0)

%%
%header (functor PlcLexerFun(structure Tokens: PlcParser_TOKENS));
digit=[0-9];
ws = [\ \t];
id = [a-zA-Z][a-zA-Z0-9_]*;
comment = \(\*([^*]*|\*[^)])*\*\);
%%

"fn"      =>(Tokens.FN(!pos,!pos));
"true"    =>(Tokens.TRUE(!pos,!pos));
"ise"     =>(Tokens.ISE(!pos,!pos));
"tl"      =>(Tokens.TL(!pos,!pos));
"print"   =>(Tokens.PRINT(!pos,!pos));
"match"   =>(Tokens.MATCH(!pos,!pos));
"fun"     =>(Tokens.FUN(!pos,!pos));
"var"     =>(Tokens.VAR(!pos,!pos));
"rec"     =>(Tokens.REC(!pos,!pos));
"false"   =>(Tokens.FALSE(!pos,!pos));
"if"      =>(Tokens.IF(!pos,!pos));
"with"    =>(Tokens.WITH(!pos,!pos));
"Nil"     =>(Tokens.NIL(!pos,!pos));
"hd"      =>(Tokens.HD(!pos,!pos));
"then"    =>(Tokens.THEN(!pos,!pos));
"else"    =>(Tokens.ELSE(!pos,!pos));
"end"     =>(Tokens.END(!pos,!pos));
"Int"     =>(Tokens.INT(!pos,!pos));
"Bool"    =>(Tokens.BOOL(!pos,!pos));

"::"	=>(Tokens.DUPLO_DOIS_PONTOS(!pos,!pos));
"->"    =>(Tokens.MENOS_MAIOR(!pos,!pos));
"!="    =>(Tokens.DIFERENTE(!pos,!pos));
"&&"    =>(Tokens.DUPLO_E_COMERCIAL(!pos,!pos));
"<="    =>(Tokens.MENOR_IGUAL(!pos,!pos));
";"     =>(Tokens.PONTO_VIRGULA(!pos,!pos));
"="     =>(Tokens.IGUAL(!pos,!pos));
":"     =>(Tokens.DOIS_PONTOS(!pos,!pos));
"!"     =>(Tokens.EXCLAMACAO(!pos,!pos));
"-"     =>(Tokens.MENOS(!pos,!pos));
"+"     =>(Tokens.MAIS(!pos,!pos));
"*"     =>(Tokens.VEZES(!pos,!pos));
"/"     =>(Tokens.DIVIDIDO(!pos,!pos));
"<"     =>(Tokens.MENOR(!pos,!pos));
">"     =>(Tokens.MAIOR(!pos,!pos));
"["     =>(Tokens.ABRE_COLCHETE(!pos,!pos));
"]"     =>(Tokens.FECHA_COLCHETE(!pos,!pos));
"("     =>(Tokens.ABRE_PARENTESES(!pos,!pos));
")"     =>(Tokens.FECHA_PARENTESES(!pos,!pos));
"{"     =>(Tokens.ABRE_CHAVE(!pos,!pos));
"}"     =>(Tokens.FECHA_CHAVE(!pos,!pos));
","     =>(Tokens.VIRGULA(!pos,!pos));
"|"     =>(Tokens.BARRA_VERTICAL(!pos,!pos));
"_"     =>(Tokens.UNDERLINE(!pos,!pos));

\n       => (lineNumber := !lineNumber + 1;lex());
{ws}+    => (lex());
{comment} => (lex());

{digit}+ => (Tokens.NUM (valOf (Int.fromString yytext), !pos, !pos));
{id}     => (Tokens.ID (yytext, !pos, !pos));
.        => (error ("No match. "^yytext,!pos,!pos);
             lex());