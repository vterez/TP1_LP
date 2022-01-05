fun junta (Var (x), Var (y)) = Var (x^y);
fun retorna (Var (x)) = (print(x);x);
fun teste (f:unit) = print("__Finish");
fun quebra_plcType_list (ListT x) = x
 |  quebra_plcType_list x = [x];
fun quebra_plcType_fun (FunT (x,y)) = [x,y];
 |  quebra_plcType_list _ = raise Match;

%%
%name PlcParser
%verbose

%pos int

%term NUM of int | ID of string | EOF | VAR | FUN | REC | IF | THEN | ELSE | MATCH | WITH
    | HD | TL | ISE | PRINT | FN | END | TRUE | FALSE | NIL | BOOL | INT
    | PONTO_VIRGULA | IGUAL | DIFERENTE | DOIS_PONTOS | DUPLO_DOIS_PONTOS | EXCLAMACAO | MENOS | MENOS_MAIOR | DUPLO_E_COMERCIAL | MAIS | VEZES 
    | DIVIDIDO | MENOR | MAIOR | MENOR_IGUAL | ABRE_COLCHETE | FECHA_COLCHETE | ABRE_PARENTESES | FECHA_PARENTESES 
    | ABRE_CHAVE | FECHA_CHAVE | VIRGULA | BARRA_VERTICAL | UNDERLINE

%nonterm Start of string | Start2 of string | Prog of unit | Expr_multipla of unit | Expr_multipla2 of unit 
    | Expr_simples of unit | Decl of expr | Atomic_expr of unit
    | App_expr of unit | Const of unit | Comps of unit | Match_expr of unit | Cond_expr of unit
    | Args of (plcType * string) list | Params of (plcType * string) list | Typed_var of plcType * string | Type of plcType | Atomic_type of plcType | Types of pltType
    | Id of unit | Num of expr

%right PONTO_VIRGULA MENOS_MAIOR
%nonassoc IF
%left ELSE
%left DUPLO_E_COMERCIAL
%left IGUAL DIFERENTE
%left MENOR MENOR_IGUAL
%right DUPLO_DOIS_PONTOS
%left MAIS MENOS
%left VEZES DIVIDIDO
%nonassoc EXCLAMACAO HD TL ISE PRINT ID
%left ABRE_COLCHETE

%eop EOF

%start Start

%%

Start:
   Start2 ("zero")

Start2:
   Start2 Prog ("This")
 | ("Finish")

Decl: 
   VAR Id IGUAL Expr_simples PONTO_VIRGULA Prog(print("__VAR ID = Expr_simples\n"))
 | FUN Id Args IGUAL Expr_simples PONTO_VIRGULA Prog(print("__FUN ID Args = Expr_simples\n"))
 | FUN REC Id Args DOIS_PONTOS Type IGUAL Expr_simples PONTO_VIRGULA Prog(print("__FUN REC ID Args : Type = Expr_simples\n"))

Prog: 
   Decl (print("__Decl\n"))
 | Expr_multipla (print("__Expr_simples__\n"))

Expr_multipla:
   Expr_multipla2 Expr_simples (print(""))

Expr_multipla2:
   Expr_multipla2 Expr_simples PONTO_VIRGULA (print("__Expr_simples ; Expr_simples\n"))
 | (print(""))
 
Expr_simples: 
   Atomic_expr (print("__Atomic_expr __expr\n"))
 | App_expr (print("__App_expr __expr\n"))
 | IF Expr_simples THEN Expr_simples ELSE Expr_simples (print("__IF Expr_simples THEN Expr_multipla ELSE Expr_multipla __expr\n"))
 | MATCH Expr_simples WITH Match_expr (print("__MATCH Expr_simples WITH Match_expr__expr __expr\n"))
 | EXCLAMACAO Expr_simples (print("__! Expr_simples __expr\n"))
 | MENOS Expr_simples (print("__- Expr_simples __expr\n"))
 | HD Expr_simples (print("__HD Expr_simples __expr\n"))
 | TL Expr_simples (print("__TL Expr_simples __expr\n"))
 | ISE Expr_simples (print("__ISE Expr_simples __expr\n"))
 | PRINT Expr_simples (print("__PRINT Expr_simples __expr\n"))
 | Expr_simples DUPLO_E_COMERCIAL Expr_simples (print("__Expr_simples && Expr_simples __expr\n"))
 | Expr_simples MAIS Expr_simples (print("__Expr_simples + Expr_simples __expr\n"))
 | Expr_simples MENOS Expr_simples (print("__Expr_simples - Expr_simples __expr\n"))
 | Expr_simples VEZES Expr_simples (print("__Expr_simples * Expr_simples __expr\n"))
 | Expr_simples DIVIDIDO Expr_simples (print("__Expr_simples / Expr_simples __expr\n"))
 | Expr_simples IGUAL Expr_simples (print("__Expr_simples = Expr_simples __expr\n"))
 | Expr_simples DIFERENTE Expr_simples (print("__Expr_simples != Expr_simples __expr\n"))
 | Expr_simples MENOR Expr_simples (print("__Expr_simples < Expr_simples __expr\n"))
 | Expr_simples MENOR_IGUAL Expr_simples (print("__Expr_simples <= Expr_simples __expr\n"))
 | Expr_simples DUPLO_DOIS_PONTOS Expr_simples (print("__Expr_simples :: Expr_simples __expr\n"))
 | Expr_simples ABRE_COLCHETE Num FECHA_COLCHETE (print("__Expr_simples [NUM] __expr\n"))

Atomic_expr: 
   Const (print("__Const"))
 | Id (print(""))
 | ABRE_CHAVE Prog FECHA_CHAVE (print("__{ Prog }"))
 | ABRE_PARENTESES Expr_simples FECHA_PARENTESES (print("__( Expr )"))
 | ABRE_PARENTESES Comps FECHA_PARENTESES (print("__( Comps )"))
 | FN Args IGUAL MAIOR Expr_multipla END (print("__FN Args => Expr END"))

App_expr:
   Atomic_expr Atomic_expr (print("__Atomic_expr Atomic_expr"))
 | App_expr Atomic_expr (print("__App_expr Atomic_expr"))

Const:
   TRUE (print("__TRUE"))
 | FALSE (print("__FALSE"))
 | Num (print(""))
 | ABRE_PARENTESES FECHA_PARENTESES (print("__( )"))
 | ABRE_PARENTESES Type ABRE_COLCHETE FECHA_COLCHETE FECHA_PARENTESES (print("__( Type [] )"))

Comps:
   Expr_simples VIRGULA Expr_simples (print("__Expr , Expr"))
 | Expr_simples VIRGULA Comps (print("__Expr , Comps"))

Match_expr:
   END (print("__END"))
 | BARRA_VERTICAL Expr_simples MENOS_MAIOR Expr_multipla Match_expr (print("__| Cond_expr -> Expr Match_expr"))
 | BARRA_VERTICAL UNDERLINE MENOS_MAIOR Expr_multipla Match_expr (print("__| Cond_expr -> Expr Match_expr"))


Args:
   ABRE_PARENTESES FECHA_PARENTESES ([])
 | ABRE_PARENTESES Params FECHA_PARENTESES (Params)

Params:
   Typed_var ([Typed_var])
 | Typed_var VIRGULA Params (Typed_var::Params)

Typed_var:
   Type Id ((Type,Id))

Type:
   Atomic_type (Atomic_type)
 | ABRE_PARENTESES Types FECHA_PARENTESES (Types)
 | ABRE_COLCHETE Type FECHA_COLCHETE (SeqT Type)
 | Type MENOS_MAIOR Type (FunT (Type1,Type2))

Atomic_type:
   NIL (ListT [])
 | BOOL (BoolT)
 | INT (IntT)
 | ABRE_PARENTESES Type FECHA_PARENTESES (Type)

Types:
   Type VIRGULA Type (ListT ((quebra_plcType_list Type1)@(quebra_plcType_list Type2)))
 | Type VIRGULA Types (ListT ((quebra_plcType_list Type)@(quebra_plcType_list Types)))

Num:
   NUM (ConI(NUM))

Id:
   ID (Var(ID))