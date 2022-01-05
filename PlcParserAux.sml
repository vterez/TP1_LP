(* Plc Parser Aux *)

(*Função que transforma lista de (plcType * string) em lista de string*)
fun fazLista (xs: (plcType * string) list) = 
  foldr (fn (x:plcType*string,y:string list) => ((#2 x))::y) [] xs;

(*Função que recebe um índice, uma lista de strings, uma expressão e o tamanho da lista e retorna a expressão*)
fun makeFunAuxComTamanho (n: int, xs: string list, e: expr, tam: int) : expr =
    if n = tam then Let(List.nth (xs,n-1),Item(n,Var "$list"),e)
    else Let(List.nth (xs,n-1),Item(n,Var "$list"),makeFunAuxComTamanho(n+1,xs,e,tam));

(* Create the body of a function expression. *)
fun makeFunAux (n: int, xs: (plcType * string) list, e: expr) =
    let
      val tam = List.length xs;
      val lista = fazLista xs;
    in
      makeFunAuxComTamanho(n,lista,e,tam)
    end;

(* Create the list of arguments of a function. *)
fun makeType (args: (plcType * string) list): plcType =
    ListT(foldr (fn (x:plcType*string,y:plcType list) => (#1 x)::y) [] args);

(* Create a function expression. *)
fun makeFun (f: string, xs: (plcType * string) list, rt: plcType, e1: expr, e2: expr): expr =
  case xs of
      [] => Letrec(f, ListT [], "()", rt, e1, e2)
    | (t,x)::[] => Letrec(f, t, x, rt, e1, e2)
    | _ =>
      let
        val t = makeType xs
        val e1' = makeFunAux (1, xs, e1)
      in
        Letrec(f, t, "$list", rt, e1', e2)
      end;

(* Create a Anonymus function expression. *)
fun makeAnon (xs:(plcType * string) list, e:expr):expr =
  case xs of
      [] => Anon(ListT [], "()", e)
    | (t,x)::[] => Anon(t,x,e)
    | _ =>
      let
        val t = makeType xs
      in
        let
          val e' = makeFunAux (1, xs, e)
        in
          Anon(t,"$list",e')
        end
      end;