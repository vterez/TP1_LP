fun junta (Var (x), Var (y)) = Var (x^y);
fun retorna (Var (x)) = (print(x);x);
fun teste (f:unit) = print("__Finish");
fun quebra_plcType_list (ListT x) = x
 |  quebra_plcType_list x = [x];
fun quebraTupla((x,y)) = y;
fun quebraNum(ConI x) = x;

%%
%name PlcParser
%verbose

%pos int

%term NUM of int | ID of string | EOF | VAR | FUN | REC | IF | THEN | ELSE | MATCH | WITH
    | HD | TL | ISE | PRINT | FN | END | TRUE | FALSE | NIL | BOOL | INT
    | PONTO_VIRGULA | IGUAL | DIFERENTE | DOIS_PONTOS | DUPLO_DOIS_PONTOS | EXCLAMACAO | MENOS | MENOS_MAIOR | DUPLO_E_COMERCIAL | MAIS | VEZES 
    | DIVIDIDO | MENOR | MAIOR | MENOR_IGUAL | ABRE_COLCHETE | FECHA_COLCHETE | ABRE_PARENTESES | FECHA_PARENTESES 
    | ABRE_CHAVE | FECHA_CHAVE | VIRGULA | BARRA_VERTICAL | UNDERLINE

%nonterm Start of expr | Prog of expr | Decl of expr | Expr_multipla of expr 
   | Expr_simples of expr | Args of (plcType * string) list 
   | Params of (plcType * string) list | Typed_var of plcType * string
   | Type of plcType | Atomic_type of plcType | Types of plcType
   | Atomic_expr of expr | App_expr of expr | Const of expr
   | Comps of expr list | Match_expr of  (expr option * expr) list
   | Id of string | Num of int

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
   Prog (Prog)

Prog:
   Decl (Decl)
 | Expr_multipla (Expr_multipla)

Decl: 
   VAR Id IGUAL Expr_simples PONTO_VIRGULA Prog(Let(Id,Expr_simples,Prog))
 | FUN Id Args IGUAL Expr_simples PONTO_VIRGULA Prog(Let(Id,makeAnon(Args,Expr_simples),Prog))
 | FUN REC Id Args DOIS_PONTOS Type IGUAL Expr_simples PONTO_VIRGULA Prog(makeFun (Id,Args,Type,Expr_simples,Prog))

Expr_multipla:
   Expr_simples PONTO_VIRGULA Expr_multipla (Prim2(";",Expr_simples, Expr_multipla))
 | Expr_simples (Expr_simples)

Expr_simples: 
   Atomic_expr (Atomic_expr)
 | App_expr (App_expr)
 | IF Expr_simples THEN Expr_simples ELSE Expr_simples (If(Expr_simples1,Expr_simples2,Expr_simples3))
 | MATCH Expr_simples WITH Match_expr (Match(Expr_simples,Match_expr))
 | EXCLAMACAO Expr_simples (Prim1("!",Expr_simples))
 | MENOS Expr_simples (Prim1("-",Expr_simples))
 | HD Expr_simples (Prim1("hd",Expr_simples))
 | TL Expr_simples (Prim1("tl",Expr_simples))
 | ISE Expr_simples (Prim1("ise",Expr_simples))
 | PRINT Expr_simples (Prim1("print",Expr_simples))
 | Expr_simples DUPLO_E_COMERCIAL Expr_simples (Prim2("&&",Expr_simples1,Expr_simples2))
 | Expr_simples MAIS Expr_simples (Prim2("+",Expr_simples1,Expr_simples2))
 | Expr_simples MENOS Expr_simples (Prim2("-",Expr_simples1,Expr_simples2))
 | Expr_simples VEZES Expr_simples (Prim2("*",Expr_simples1,Expr_simples2))
 | Expr_simples DIVIDIDO Expr_simples (Prim2("/",Expr_simples1,Expr_simples2))
 | Expr_simples IGUAL Expr_simples (Prim2("=",Expr_simples1,Expr_simples2))
 | Expr_simples DIFERENTE Expr_simples (Prim2("!=",Expr_simples1,Expr_simples2))
 | Expr_simples MENOR Expr_simples (Prim2("<",Expr_simples1,Expr_simples2))
 | Expr_simples MENOR_IGUAL Expr_simples (Prim2("<=",Expr_simples1,Expr_simples2))
 | Expr_simples DUPLO_DOIS_PONTOS Expr_simples (Prim2("::",Expr_simples1,Expr_simples2))
 | Expr_simples ABRE_COLCHETE Num FECHA_COLCHETE (Item(Num,Expr_simples))

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

Atomic_expr: 
   Const (Const)
 | Id (Var Id)
 | ABRE_CHAVE Prog FECHA_CHAVE (Prog)
 | ABRE_PARENTESES Expr_simples FECHA_PARENTESES (Expr_simples)
 | ABRE_PARENTESES Comps FECHA_PARENTESES (List Comps)
 | FN Args IGUAL MAIOR Expr_simples END (makeAnon(Args,Expr_simples))

Comps:
   Expr_simples VIRGULA Expr_simples ([Expr_simples1,Expr_simples2])
 | Expr_simples VIRGULA Comps (Expr_simples::Comps)

App_expr: 
   Atomic_expr Atomic_expr (Call(Atomic_expr1,Atomic_expr2))
 | App_expr Atomic_expr (Call(App_expr,Atomic_expr))

Const:
   TRUE (ConB true)
 | FALSE (ConB false)
 | Num (ConI Num)
 | ABRE_PARENTESES FECHA_PARENTESES (List [])
 | ABRE_PARENTESES Type ABRE_COLCHETE FECHA_COLCHETE FECHA_PARENTESES (ESeq Type)

Match_expr:
   END ([])
 | BARRA_VERTICAL Expr_simples MENOS_MAIOR Expr_simples Match_expr ((SOME (Expr_simples1),Expr_simples2)::Match_expr)
 | BARRA_VERTICAL UNDERLINE MENOS_MAIOR Expr_simples Match_expr ((NONE,Expr_simples)::Match_expr)

Num:
   NUM (NUM)

Id:
   ID (ID)