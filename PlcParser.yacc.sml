functor PlcParserLrValsFun(structure Token : TOKEN)
 : sig structure ParserData : PARSER_DATA
       structure Tokens : PlcParser_TOKENS
   end
 = 
struct
structure ParserData=
struct
structure Header = 
struct
fun junta (Var (x), Var (y)) = Var (x^y);
fun retorna (Var (x)) = (print(x);x);
fun teste (f:unit) = print("__Finish");
fun quebra_plcType_list (ListT x) = x
 |  quebra_plcType_list x = [x];
fun quebraTupla((x,y)) = y;
fun quebraNum(ConI x) = x;


end
structure LrTable = Token.LrTable
structure Token = Token
local open LrTable in 
val table=let val actionRows =
"\
\\001\000\001\000\028\000\000\000\
\\001\000\001\000\028\000\002\000\027\000\004\000\026\000\005\000\025\000\
\\007\000\024\000\010\000\023\000\012\000\022\000\013\000\021\000\
\\014\000\020\000\015\000\019\000\016\000\018\000\018\000\017\000\
\\019\000\016\000\028\000\015\000\029\000\014\000\040\000\013\000\
\\042\000\012\000\000\000\
\\001\000\001\000\028\000\002\000\027\000\007\000\024\000\010\000\023\000\
\\012\000\022\000\013\000\021\000\014\000\020\000\015\000\019\000\
\\016\000\018\000\018\000\017\000\019\000\016\000\020\000\053\000\
\\021\000\052\000\022\000\051\000\028\000\015\000\029\000\014\000\
\\038\000\050\000\040\000\049\000\041\000\048\000\042\000\012\000\000\000\
\\001\000\001\000\028\000\002\000\027\000\007\000\024\000\010\000\023\000\
\\012\000\022\000\013\000\021\000\014\000\020\000\015\000\019\000\
\\016\000\018\000\018\000\017\000\019\000\016\000\028\000\015\000\
\\029\000\014\000\040\000\013\000\042\000\012\000\000\000\
\\001\000\001\000\028\000\002\000\027\000\007\000\024\000\010\000\023\000\
\\012\000\022\000\013\000\021\000\014\000\020\000\015\000\019\000\
\\016\000\018\000\018\000\017\000\019\000\016\000\028\000\015\000\
\\029\000\014\000\040\000\013\000\042\000\012\000\046\000\126\000\000\000\
\\001\000\002\000\027\000\000\000\
\\001\000\002\000\027\000\006\000\065\000\000\000\
\\001\000\002\000\027\000\030\000\082\000\000\000\
\\001\000\003\000\000\000\000\000\
\\001\000\008\000\095\000\024\000\041\000\025\000\040\000\027\000\039\000\
\\029\000\038\000\031\000\037\000\032\000\036\000\033\000\035\000\
\\034\000\034\000\035\000\033\000\037\000\032\000\038\000\031\000\000\000\
\\001\000\009\000\127\000\024\000\041\000\025\000\040\000\027\000\039\000\
\\029\000\038\000\031\000\037\000\032\000\036\000\033\000\035\000\
\\034\000\034\000\035\000\033\000\037\000\032\000\038\000\031\000\000\000\
\\001\000\011\000\094\000\024\000\041\000\025\000\040\000\027\000\039\000\
\\029\000\038\000\031\000\037\000\032\000\036\000\033\000\035\000\
\\034\000\034\000\035\000\033\000\037\000\032\000\038\000\031\000\000\000\
\\001\000\017\000\115\000\024\000\041\000\025\000\040\000\027\000\039\000\
\\029\000\038\000\031\000\037\000\032\000\036\000\033\000\035\000\
\\034\000\034\000\035\000\033\000\037\000\032\000\038\000\031\000\
\\045\000\114\000\000\000\
\\001\000\017\000\115\000\045\000\114\000\000\000\
\\001\000\017\000\131\000\024\000\041\000\025\000\040\000\027\000\039\000\
\\029\000\038\000\031\000\037\000\032\000\036\000\033\000\035\000\
\\034\000\034\000\035\000\033\000\037\000\032\000\038\000\031\000\000\000\
\\001\000\020\000\053\000\021\000\052\000\022\000\051\000\038\000\050\000\
\\040\000\088\000\000\000\
\\001\000\020\000\053\000\021\000\052\000\022\000\051\000\038\000\050\000\
\\040\000\088\000\041\000\093\000\000\000\
\\001\000\023\000\130\000\024\000\041\000\025\000\040\000\027\000\039\000\
\\029\000\038\000\031\000\037\000\032\000\036\000\033\000\035\000\
\\034\000\034\000\035\000\033\000\037\000\032\000\038\000\031\000\000\000\
\\001\000\023\000\135\000\024\000\041\000\025\000\040\000\027\000\039\000\
\\029\000\038\000\031\000\037\000\032\000\036\000\033\000\035\000\
\\034\000\034\000\035\000\033\000\037\000\032\000\038\000\031\000\000\000\
\\001\000\023\000\145\000\024\000\041\000\025\000\040\000\027\000\039\000\
\\029\000\038\000\031\000\037\000\032\000\036\000\033\000\035\000\
\\034\000\034\000\035\000\033\000\037\000\032\000\038\000\031\000\000\000\
\\001\000\024\000\041\000\025\000\040\000\027\000\039\000\029\000\038\000\
\\030\000\132\000\031\000\037\000\032\000\036\000\033\000\035\000\
\\034\000\034\000\035\000\033\000\037\000\032\000\038\000\031\000\000\000\
\\001\000\024\000\041\000\025\000\040\000\027\000\039\000\029\000\038\000\
\\031\000\037\000\032\000\036\000\033\000\035\000\034\000\034\000\
\\035\000\033\000\037\000\032\000\038\000\031\000\041\000\084\000\
\\044\000\083\000\000\000\
\\001\000\024\000\089\000\000\000\
\\001\000\024\000\098\000\000\000\
\\001\000\024\000\117\000\000\000\
\\001\000\024\000\141\000\030\000\082\000\000\000\
\\001\000\026\000\129\000\000\000\
\\001\000\030\000\082\000\038\000\081\000\000\000\
\\001\000\030\000\082\000\038\000\081\000\041\000\106\000\044\000\105\000\000\000\
\\001\000\030\000\082\000\039\000\107\000\000\000\
\\001\000\030\000\082\000\041\000\106\000\044\000\105\000\000\000\
\\001\000\030\000\133\000\000\000\
\\001\000\036\000\109\000\000\000\
\\001\000\039\000\099\000\000\000\
\\001\000\039\000\100\000\000\000\
\\001\000\040\000\057\000\000\000\
\\001\000\041\000\080\000\000\000\
\\001\000\041\000\104\000\000\000\
\\001\000\041\000\112\000\000\000\
\\001\000\041\000\120\000\000\000\
\\001\000\043\000\079\000\000\000\
\\148\000\000\000\
\\149\000\000\000\
\\150\000\000\000\
\\151\000\000\000\
\\152\000\000\000\
\\153\000\000\000\
\\154\000\000\000\
\\155\000\023\000\042\000\024\000\041\000\025\000\040\000\027\000\039\000\
\\029\000\038\000\031\000\037\000\032\000\036\000\033\000\035\000\
\\034\000\034\000\035\000\033\000\037\000\032\000\038\000\031\000\000\000\
\\156\000\001\000\028\000\002\000\027\000\016\000\018\000\018\000\017\000\
\\019\000\016\000\040\000\013\000\042\000\012\000\000\000\
\\157\000\001\000\028\000\002\000\027\000\016\000\018\000\018\000\017\000\
\\019\000\016\000\040\000\013\000\042\000\012\000\000\000\
\\158\000\024\000\041\000\025\000\040\000\027\000\039\000\029\000\038\000\
\\031\000\037\000\032\000\036\000\033\000\035\000\034\000\034\000\
\\035\000\033\000\037\000\032\000\038\000\031\000\000\000\
\\159\000\000\000\
\\160\000\038\000\031\000\000\000\
\\161\000\033\000\035\000\034\000\034\000\038\000\031\000\000\000\
\\162\000\038\000\031\000\000\000\
\\163\000\038\000\031\000\000\000\
\\164\000\038\000\031\000\000\000\
\\165\000\038\000\031\000\000\000\
\\166\000\024\000\041\000\025\000\040\000\027\000\039\000\029\000\038\000\
\\032\000\036\000\033\000\035\000\034\000\034\000\035\000\033\000\
\\037\000\032\000\038\000\031\000\000\000\
\\167\000\033\000\035\000\034\000\034\000\038\000\031\000\000\000\
\\168\000\033\000\035\000\034\000\034\000\038\000\031\000\000\000\
\\169\000\038\000\031\000\000\000\
\\170\000\038\000\031\000\000\000\
\\171\000\027\000\039\000\029\000\038\000\032\000\036\000\033\000\035\000\
\\034\000\034\000\035\000\033\000\037\000\032\000\038\000\031\000\000\000\
\\172\000\027\000\039\000\029\000\038\000\032\000\036\000\033\000\035\000\
\\034\000\034\000\035\000\033\000\037\000\032\000\038\000\031\000\000\000\
\\173\000\027\000\039\000\029\000\038\000\032\000\036\000\033\000\035\000\
\\034\000\034\000\038\000\031\000\000\000\
\\174\000\027\000\039\000\029\000\038\000\032\000\036\000\033\000\035\000\
\\034\000\034\000\038\000\031\000\000\000\
\\175\000\027\000\039\000\029\000\038\000\032\000\036\000\033\000\035\000\
\\034\000\034\000\038\000\031\000\000\000\
\\176\000\000\000\
\\177\000\000\000\
\\178\000\000\000\
\\179\000\044\000\111\000\000\000\
\\180\000\000\000\
\\181\000\000\000\
\\182\000\000\000\
\\183\000\000\000\
\\184\000\000\000\
\\185\000\030\000\082\000\000\000\
\\186\000\000\000\
\\187\000\000\000\
\\188\000\000\000\
\\189\000\000\000\
\\190\000\030\000\082\000\044\000\105\000\000\000\
\\191\000\000\000\
\\192\000\000\000\
\\193\000\000\000\
\\194\000\000\000\
\\195\000\000\000\
\\196\000\000\000\
\\197\000\000\000\
\\198\000\024\000\041\000\025\000\040\000\027\000\039\000\029\000\038\000\
\\031\000\037\000\032\000\036\000\033\000\035\000\034\000\034\000\
\\035\000\033\000\037\000\032\000\038\000\031\000\044\000\083\000\000\000\
\\199\000\000\000\
\\200\000\000\000\
\\201\000\000\000\
\\202\000\000\000\
\\203\000\000\000\
\\204\000\000\000\
\\205\000\000\000\
\\206\000\000\000\
\\207\000\000\000\
\\208\000\000\000\
\\209\000\000\000\
\\210\000\000\000\
\\211\000\000\000\
\"
val actionRowNumbers =
"\001\000\097\000\086\000\085\000\
\\050\000\049\000\048\000\043\000\
\\042\000\041\000\001\000\002\000\
\\003\000\003\000\096\000\095\000\
\\035\000\003\000\003\000\003\000\
\\003\000\003\000\003\000\006\000\
\\005\000\104\000\103\000\094\000\
\\093\000\000\000\003\000\003\000\
\\003\000\003\000\003\000\003\000\
\\003\000\003\000\003\000\003\000\
\\003\000\040\000\036\000\075\000\
\\027\000\021\000\098\000\002\000\
\\015\000\081\000\080\000\079\000\
\\054\000\053\000\022\000\016\000\
\\058\000\057\000\056\000\055\000\
\\011\000\009\000\035\000\005\000\
\\023\000\033\000\067\000\066\000\
\\063\000\062\000\060\000\059\000\
\\061\000\068\000\065\000\064\000\
\\047\000\087\000\089\000\034\000\
\\015\000\003\000\088\000\037\000\
\\028\000\029\000\015\000\032\000\
\\007\000\072\000\038\000\070\000\
\\013\000\003\000\024\000\035\000\
\\003\000\069\000\039\000\078\000\
\\092\000\091\000\076\000\015\000\
\\082\000\077\000\030\000\003\000\
\\074\000\015\000\071\000\052\000\
\\004\000\100\000\010\000\003\000\
\\026\000\017\000\099\000\084\000\
\\083\000\014\000\073\000\020\000\
\\031\000\003\000\018\000\015\000\
\\001\000\090\000\003\000\003\000\
\\051\000\001\000\025\000\044\000\
\\012\000\012\000\045\000\003\000\
\\101\000\102\000\019\000\001\000\
\\046\000\008\000"
val gotoT =
"\
\\001\000\145\000\002\000\009\000\003\000\008\000\004\000\007\000\
\\005\000\006\000\012\000\005\000\013\000\004\000\014\000\003\000\
\\017\000\002\000\018\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\012\000\027\000\014\000\003\000\017\000\002\000\018\000\001\000\000\000\
\\012\000\028\000\014\000\003\000\017\000\002\000\018\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\002\000\041\000\003\000\008\000\004\000\007\000\005\000\006\000\
\\012\000\005\000\013\000\004\000\014\000\003\000\017\000\002\000\
\\018\000\001\000\000\000\
\\005\000\045\000\009\000\044\000\010\000\043\000\012\000\005\000\
\\013\000\004\000\014\000\003\000\015\000\042\000\017\000\002\000\
\\018\000\001\000\000\000\
\\005\000\052\000\012\000\005\000\013\000\004\000\014\000\003\000\
\\017\000\002\000\018\000\001\000\000\000\
\\005\000\053\000\012\000\005\000\013\000\004\000\014\000\003\000\
\\017\000\002\000\018\000\001\000\000\000\
\\000\000\
\\000\000\
\\006\000\054\000\000\000\
\\005\000\056\000\012\000\005\000\013\000\004\000\014\000\003\000\
\\017\000\002\000\018\000\001\000\000\000\
\\005\000\057\000\012\000\005\000\013\000\004\000\014\000\003\000\
\\017\000\002\000\018\000\001\000\000\000\
\\005\000\058\000\012\000\005\000\013\000\004\000\014\000\003\000\
\\017\000\002\000\018\000\001\000\000\000\
\\005\000\059\000\012\000\005\000\013\000\004\000\014\000\003\000\
\\017\000\002\000\018\000\001\000\000\000\
\\005\000\060\000\012\000\005\000\013\000\004\000\014\000\003\000\
\\017\000\002\000\018\000\001\000\000\000\
\\005\000\061\000\012\000\005\000\013\000\004\000\014\000\003\000\
\\017\000\002\000\018\000\001\000\000\000\
\\017\000\062\000\000\000\
\\017\000\064\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\018\000\065\000\000\000\
\\005\000\066\000\012\000\005\000\013\000\004\000\014\000\003\000\
\\017\000\002\000\018\000\001\000\000\000\
\\005\000\067\000\012\000\005\000\013\000\004\000\014\000\003\000\
\\017\000\002\000\018\000\001\000\000\000\
\\005\000\068\000\012\000\005\000\013\000\004\000\014\000\003\000\
\\017\000\002\000\018\000\001\000\000\000\
\\005\000\069\000\012\000\005\000\013\000\004\000\014\000\003\000\
\\017\000\002\000\018\000\001\000\000\000\
\\005\000\070\000\012\000\005\000\013\000\004\000\014\000\003\000\
\\017\000\002\000\018\000\001\000\000\000\
\\005\000\071\000\012\000\005\000\013\000\004\000\014\000\003\000\
\\017\000\002\000\018\000\001\000\000\000\
\\005\000\072\000\012\000\005\000\013\000\004\000\014\000\003\000\
\\017\000\002\000\018\000\001\000\000\000\
\\005\000\073\000\012\000\005\000\013\000\004\000\014\000\003\000\
\\017\000\002\000\018\000\001\000\000\000\
\\005\000\074\000\012\000\005\000\013\000\004\000\014\000\003\000\
\\017\000\002\000\018\000\001\000\000\000\
\\005\000\075\000\012\000\005\000\013\000\004\000\014\000\003\000\
\\017\000\002\000\018\000\001\000\000\000\
\\004\000\076\000\005\000\006\000\012\000\005\000\013\000\004\000\
\\014\000\003\000\017\000\002\000\018\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\005\000\045\000\009\000\084\000\010\000\043\000\011\000\083\000\
\\012\000\005\000\013\000\004\000\014\000\003\000\015\000\042\000\
\\017\000\002\000\018\000\001\000\000\000\
\\009\000\085\000\010\000\043\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\007\000\090\000\008\000\089\000\009\000\088\000\010\000\043\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\006\000\094\000\000\000\
\\017\000\095\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\009\000\099\000\010\000\043\000\000\000\
\\005\000\101\000\012\000\005\000\013\000\004\000\014\000\003\000\
\\015\000\100\000\017\000\002\000\018\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\009\000\106\000\010\000\043\000\011\000\083\000\000\000\
\\000\000\
\\017\000\108\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\016\000\111\000\000\000\
\\005\000\114\000\012\000\005\000\013\000\004\000\014\000\003\000\
\\017\000\002\000\018\000\001\000\000\000\
\\000\000\
\\006\000\116\000\000\000\
\\005\000\117\000\012\000\005\000\013\000\004\000\014\000\003\000\
\\017\000\002\000\018\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\009\000\120\000\010\000\043\000\011\000\119\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\005\000\121\000\012\000\005\000\013\000\004\000\014\000\003\000\
\\017\000\002\000\018\000\001\000\000\000\
\\000\000\
\\007\000\122\000\008\000\089\000\009\000\088\000\010\000\043\000\000\000\
\\000\000\
\\000\000\
\\005\000\123\000\012\000\005\000\013\000\004\000\014\000\003\000\
\\017\000\002\000\018\000\001\000\000\000\
\\000\000\
\\000\000\
\\005\000\126\000\012\000\005\000\013\000\004\000\014\000\003\000\
\\017\000\002\000\018\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\005\000\132\000\012\000\005\000\013\000\004\000\014\000\003\000\
\\017\000\002\000\018\000\001\000\000\000\
\\000\000\
\\009\000\134\000\010\000\043\000\000\000\
\\002\000\135\000\003\000\008\000\004\000\007\000\005\000\006\000\
\\012\000\005\000\013\000\004\000\014\000\003\000\017\000\002\000\
\\018\000\001\000\000\000\
\\000\000\
\\005\000\136\000\012\000\005\000\013\000\004\000\014\000\003\000\
\\017\000\002\000\018\000\001\000\000\000\
\\005\000\137\000\012\000\005\000\013\000\004\000\014\000\003\000\
\\017\000\002\000\018\000\001\000\000\000\
\\000\000\
\\002\000\138\000\003\000\008\000\004\000\007\000\005\000\006\000\
\\012\000\005\000\013\000\004\000\014\000\003\000\017\000\002\000\
\\018\000\001\000\000\000\
\\000\000\
\\000\000\
\\016\000\140\000\000\000\
\\016\000\141\000\000\000\
\\000\000\
\\005\000\142\000\012\000\005\000\013\000\004\000\014\000\003\000\
\\017\000\002\000\018\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\002\000\144\000\003\000\008\000\004\000\007\000\005\000\006\000\
\\012\000\005\000\013\000\004\000\014\000\003\000\017\000\002\000\
\\018\000\001\000\000\000\
\\000\000\
\\000\000\
\"
val numstates = 146
val numrules = 64
val s = ref "" and index = ref 0
val string_to_int = fn () => 
let val i = !index
in index := i+2; Char.ord(String.sub(!s,i)) + Char.ord(String.sub(!s,i+1)) * 256
end
val string_to_list = fn s' =>
    let val len = String.size s'
        fun f () =
           if !index < len then string_to_int() :: f()
           else nil
   in index := 0; s := s'; f ()
   end
val string_to_pairlist = fn (conv_key,conv_entry) =>
     let fun f () =
         case string_to_int()
         of 0 => EMPTY
          | n => PAIR(conv_key (n-1),conv_entry (string_to_int()),f())
     in f
     end
val string_to_pairlist_default = fn (conv_key,conv_entry) =>
    let val conv_row = string_to_pairlist(conv_key,conv_entry)
    in fn () =>
       let val default = conv_entry(string_to_int())
           val row = conv_row()
       in (row,default)
       end
   end
val string_to_table = fn (convert_row,s') =>
    let val len = String.size s'
        fun f ()=
           if !index < len then convert_row() :: f()
           else nil
     in (s := s'; index := 0; f ())
     end
local
  val memo = Array.array(numstates+numrules,ERROR)
  val _ =let fun g i=(Array.update(memo,i,REDUCE(i-numstates)); g(i+1))
       fun f i =
            if i=numstates then g i
            else (Array.update(memo,i,SHIFT (STATE i)); f (i+1))
          in f 0 handle General.Subscript => ()
          end
in
val entry_to_action = fn 0 => ACCEPT | 1 => ERROR | j => Array.sub(memo,(j-2))
end
val gotoT=Array.fromList(string_to_table(string_to_pairlist(NT,STATE),gotoT))
val actionRows=string_to_table(string_to_pairlist_default(T,entry_to_action),actionRows)
val actionRowNumbers = string_to_list actionRowNumbers
val actionT = let val actionRowLookUp=
let val a=Array.fromList(actionRows) in fn i=>Array.sub(a,i) end
in Array.fromList(List.map actionRowLookUp actionRowNumbers)
end
in LrTable.mkLrTable {actions=actionT,gotos=gotoT,numRules=numrules,
numStates=numstates,initialState=STATE 0}
end
end
local open Header in
type pos = int
type arg = unit
structure MlyValue = 
struct
datatype svalue = VOID | ntVOID of unit ->  unit
 | ID of unit ->  (string) | NUM of unit ->  (int)
 | Num of unit ->  (int) | Id of unit ->  (string)
 | Match_expr of unit ->  ( ( expr option * expr )  list)
 | Comps of unit ->  (expr list) | Const of unit ->  (expr)
 | App_expr of unit ->  (expr) | Atomic_expr of unit ->  (expr)
 | Types of unit ->  (plcType) | Atomic_type of unit ->  (plcType)
 | Type of unit ->  (plcType) | Typed_var of unit ->  (plcType*string)
 | Params of unit ->  ( ( plcType * string )  list)
 | Args of unit ->  ( ( plcType * string )  list)
 | Expr_simples of unit ->  (expr) | Expr_multipla of unit ->  (expr)
 | Decl of unit ->  (expr) | Prog of unit ->  (expr)
 | Start of unit ->  (expr)
end
type svalue = MlyValue.svalue
type result = expr
end
structure EC=
struct
open LrTable
infix 5 $$
fun x $$ y = y::x
val is_keyword =
fn _ => false
val preferred_change : (term list * term list) list = 
nil
val noShift = 
fn _ => false
val showTerminal =
fn (T 0) => "NUM"
  | (T 1) => "ID"
  | (T 2) => "EOF"
  | (T 3) => "VAR"
  | (T 4) => "FUN"
  | (T 5) => "REC"
  | (T 6) => "IF"
  | (T 7) => "THEN"
  | (T 8) => "ELSE"
  | (T 9) => "MATCH"
  | (T 10) => "WITH"
  | (T 11) => "HD"
  | (T 12) => "TL"
  | (T 13) => "ISE"
  | (T 14) => "PRINT"
  | (T 15) => "FN"
  | (T 16) => "END"
  | (T 17) => "TRUE"
  | (T 18) => "FALSE"
  | (T 19) => "NIL"
  | (T 20) => "BOOL"
  | (T 21) => "INT"
  | (T 22) => "PONTO_VIRGULA"
  | (T 23) => "IGUAL"
  | (T 24) => "DIFERENTE"
  | (T 25) => "DOIS_PONTOS"
  | (T 26) => "DUPLO_DOIS_PONTOS"
  | (T 27) => "EXCLAMACAO"
  | (T 28) => "MENOS"
  | (T 29) => "MENOS_MAIOR"
  | (T 30) => "DUPLO_E_COMERCIAL"
  | (T 31) => "MAIS"
  | (T 32) => "VEZES"
  | (T 33) => "DIVIDIDO"
  | (T 34) => "MENOR"
  | (T 35) => "MAIOR"
  | (T 36) => "MENOR_IGUAL"
  | (T 37) => "ABRE_COLCHETE"
  | (T 38) => "FECHA_COLCHETE"
  | (T 39) => "ABRE_PARENTESES"
  | (T 40) => "FECHA_PARENTESES"
  | (T 41) => "ABRE_CHAVE"
  | (T 42) => "FECHA_CHAVE"
  | (T 43) => "VIRGULA"
  | (T 44) => "BARRA_VERTICAL"
  | (T 45) => "UNDERLINE"
  | _ => "bogus-term"
local open Header in
val errtermvalue=
fn _ => MlyValue.VOID
end
val terms : term list = nil
 $$ (T 45) $$ (T 44) $$ (T 43) $$ (T 42) $$ (T 41) $$ (T 40) $$ (T 39)
 $$ (T 38) $$ (T 37) $$ (T 36) $$ (T 35) $$ (T 34) $$ (T 33) $$ (T 32)
 $$ (T 31) $$ (T 30) $$ (T 29) $$ (T 28) $$ (T 27) $$ (T 26) $$ (T 25)
 $$ (T 24) $$ (T 23) $$ (T 22) $$ (T 21) $$ (T 20) $$ (T 19) $$ (T 18)
 $$ (T 17) $$ (T 16) $$ (T 15) $$ (T 14) $$ (T 13) $$ (T 12) $$ (T 11)
 $$ (T 10) $$ (T 9) $$ (T 8) $$ (T 7) $$ (T 6) $$ (T 5) $$ (T 4) $$ 
(T 3) $$ (T 2)end
structure Actions =
struct 
exception mlyAction of int
local open Header in
val actions = 
fn (i392,defaultPos,stack,
    (()):arg) =>
case (i392,stack)
of  ( 0, ( ( _, ( MlyValue.Prog Prog1, Prog1left, Prog1right)) :: 
rest671)) => let val  result = MlyValue.Start (fn _ => let val  (Prog
 as Prog1) = Prog1 ()
 in (Prog)
end)
 in ( LrTable.NT 0, ( result, Prog1left, Prog1right), rest671)
end
|  ( 1, ( ( _, ( MlyValue.Decl Decl1, Decl1left, Decl1right)) :: 
rest671)) => let val  result = MlyValue.Prog (fn _ => let val  (Decl
 as Decl1) = Decl1 ()
 in (Decl)
end)
 in ( LrTable.NT 1, ( result, Decl1left, Decl1right), rest671)
end
|  ( 2, ( ( _, ( MlyValue.Expr_multipla Expr_multipla1, 
Expr_multipla1left, Expr_multipla1right)) :: rest671)) => let val  
result = MlyValue.Prog (fn _ => let val  (Expr_multipla as 
Expr_multipla1) = Expr_multipla1 ()
 in (Expr_multipla)
end)
 in ( LrTable.NT 1, ( result, Expr_multipla1left, Expr_multipla1right)
, rest671)
end
|  ( 3, ( ( _, ( MlyValue.Prog Prog1, _, Prog1right)) :: _ :: ( _, ( 
MlyValue.Expr_simples Expr_simples1, _, _)) :: _ :: ( _, ( MlyValue.Id
 Id1, _, _)) :: ( _, ( _, VAR1left, _)) :: rest671)) => let val  
result = MlyValue.Decl (fn _ => let val  (Id as Id1) = Id1 ()
 val  (Expr_simples as Expr_simples1) = Expr_simples1 ()
 val  (Prog as Prog1) = Prog1 ()
 in (Let(Id,Expr_simples,Prog))
end)
 in ( LrTable.NT 2, ( result, VAR1left, Prog1right), rest671)
end
|  ( 4, ( ( _, ( MlyValue.Prog Prog1, _, Prog1right)) :: _ :: ( _, ( 
MlyValue.Expr_simples Expr_simples1, _, _)) :: _ :: ( _, ( 
MlyValue.Args Args1, _, _)) :: ( _, ( MlyValue.Id Id1, _, _)) :: ( _, 
( _, FUN1left, _)) :: rest671)) => let val  result = MlyValue.Decl (fn
 _ => let val  (Id as Id1) = Id1 ()
 val  (Args as Args1) = Args1 ()
 val  (Expr_simples as Expr_simples1) = Expr_simples1 ()
 val  (Prog as Prog1) = Prog1 ()
 in (Let(Id,makeAnon(Args,Expr_simples),Prog))
end)
 in ( LrTable.NT 2, ( result, FUN1left, Prog1right), rest671)
end
|  ( 5, ( ( _, ( MlyValue.Prog Prog1, _, Prog1right)) :: _ :: ( _, ( 
MlyValue.Expr_simples Expr_simples1, _, _)) :: _ :: ( _, ( 
MlyValue.Type Type1, _, _)) :: _ :: ( _, ( MlyValue.Args Args1, _, _))
 :: ( _, ( MlyValue.Id Id1, _, _)) :: _ :: ( _, ( _, FUN1left, _)) :: 
rest671)) => let val  result = MlyValue.Decl (fn _ => let val  (Id as 
Id1) = Id1 ()
 val  (Args as Args1) = Args1 ()
 val  (Type as Type1) = Type1 ()
 val  (Expr_simples as Expr_simples1) = Expr_simples1 ()
 val  (Prog as Prog1) = Prog1 ()
 in (makeFun (Id,Args,Type,Expr_simples,Prog))
end)
 in ( LrTable.NT 2, ( result, FUN1left, Prog1right), rest671)
end
|  ( 6, ( ( _, ( MlyValue.Expr_multipla Expr_multipla1, _, 
Expr_multipla1right)) :: _ :: ( _, ( MlyValue.Expr_simples 
Expr_simples1, Expr_simples1left, _)) :: rest671)) => let val  result
 = MlyValue.Expr_multipla (fn _ => let val  (Expr_simples as 
Expr_simples1) = Expr_simples1 ()
 val  (Expr_multipla as Expr_multipla1) = Expr_multipla1 ()
 in (Prim2(";",Expr_simples, Expr_multipla))
end)
 in ( LrTable.NT 3, ( result, Expr_simples1left, Expr_multipla1right),
 rest671)
end
|  ( 7, ( ( _, ( MlyValue.Expr_simples Expr_simples1, 
Expr_simples1left, Expr_simples1right)) :: rest671)) => let val  
result = MlyValue.Expr_multipla (fn _ => let val  (Expr_simples as 
Expr_simples1) = Expr_simples1 ()
 in (Expr_simples)
end)
 in ( LrTable.NT 3, ( result, Expr_simples1left, Expr_simples1right), 
rest671)
end
|  ( 8, ( ( _, ( MlyValue.Atomic_expr Atomic_expr1, Atomic_expr1left, 
Atomic_expr1right)) :: rest671)) => let val  result = 
MlyValue.Expr_simples (fn _ => let val  (Atomic_expr as Atomic_expr1)
 = Atomic_expr1 ()
 in (Atomic_expr)
end)
 in ( LrTable.NT 4, ( result, Atomic_expr1left, Atomic_expr1right), 
rest671)
end
|  ( 9, ( ( _, ( MlyValue.App_expr App_expr1, App_expr1left, 
App_expr1right)) :: rest671)) => let val  result = 
MlyValue.Expr_simples (fn _ => let val  (App_expr as App_expr1) = 
App_expr1 ()
 in (App_expr)
end)
 in ( LrTable.NT 4, ( result, App_expr1left, App_expr1right), rest671)

end
|  ( 10, ( ( _, ( MlyValue.Expr_simples Expr_simples3, _, 
Expr_simples3right)) :: _ :: ( _, ( MlyValue.Expr_simples 
Expr_simples2, _, _)) :: _ :: ( _, ( MlyValue.Expr_simples 
Expr_simples1, _, _)) :: ( _, ( _, IF1left, _)) :: rest671)) => let
 val  result = MlyValue.Expr_simples (fn _ => let val  Expr_simples1 =
 Expr_simples1 ()
 val  Expr_simples2 = Expr_simples2 ()
 val  Expr_simples3 = Expr_simples3 ()
 in (If(Expr_simples1,Expr_simples2,Expr_simples3))
end)
 in ( LrTable.NT 4, ( result, IF1left, Expr_simples3right), rest671)

end
|  ( 11, ( ( _, ( MlyValue.Match_expr Match_expr1, _, Match_expr1right
)) :: _ :: ( _, ( MlyValue.Expr_simples Expr_simples1, _, _)) :: ( _, 
( _, MATCH1left, _)) :: rest671)) => let val  result = 
MlyValue.Expr_simples (fn _ => let val  (Expr_simples as Expr_simples1
) = Expr_simples1 ()
 val  (Match_expr as Match_expr1) = Match_expr1 ()
 in (Match(Expr_simples,Match_expr))
end)
 in ( LrTable.NT 4, ( result, MATCH1left, Match_expr1right), rest671)

end
|  ( 12, ( ( _, ( MlyValue.Expr_simples Expr_simples1, _, 
Expr_simples1right)) :: ( _, ( _, EXCLAMACAO1left, _)) :: rest671)) =>
 let val  result = MlyValue.Expr_simples (fn _ => let val  (
Expr_simples as Expr_simples1) = Expr_simples1 ()
 in (Prim1("!",Expr_simples))
end)
 in ( LrTable.NT 4, ( result, EXCLAMACAO1left, Expr_simples1right), 
rest671)
end
|  ( 13, ( ( _, ( MlyValue.Expr_simples Expr_simples1, _, 
Expr_simples1right)) :: ( _, ( _, MENOS1left, _)) :: rest671)) => let
 val  result = MlyValue.Expr_simples (fn _ => let val  (Expr_simples
 as Expr_simples1) = Expr_simples1 ()
 in (Prim1("-",Expr_simples))
end)
 in ( LrTable.NT 4, ( result, MENOS1left, Expr_simples1right), rest671
)
end
|  ( 14, ( ( _, ( MlyValue.Expr_simples Expr_simples1, _, 
Expr_simples1right)) :: ( _, ( _, HD1left, _)) :: rest671)) => let
 val  result = MlyValue.Expr_simples (fn _ => let val  (Expr_simples
 as Expr_simples1) = Expr_simples1 ()
 in (Prim1("hd",Expr_simples))
end)
 in ( LrTable.NT 4, ( result, HD1left, Expr_simples1right), rest671)

end
|  ( 15, ( ( _, ( MlyValue.Expr_simples Expr_simples1, _, 
Expr_simples1right)) :: ( _, ( _, TL1left, _)) :: rest671)) => let
 val  result = MlyValue.Expr_simples (fn _ => let val  (Expr_simples
 as Expr_simples1) = Expr_simples1 ()
 in (Prim1("tl",Expr_simples))
end)
 in ( LrTable.NT 4, ( result, TL1left, Expr_simples1right), rest671)

end
|  ( 16, ( ( _, ( MlyValue.Expr_simples Expr_simples1, _, 
Expr_simples1right)) :: ( _, ( _, ISE1left, _)) :: rest671)) => let
 val  result = MlyValue.Expr_simples (fn _ => let val  (Expr_simples
 as Expr_simples1) = Expr_simples1 ()
 in (Prim1("ise",Expr_simples))
end)
 in ( LrTable.NT 4, ( result, ISE1left, Expr_simples1right), rest671)

end
|  ( 17, ( ( _, ( MlyValue.Expr_simples Expr_simples1, _, 
Expr_simples1right)) :: ( _, ( _, PRINT1left, _)) :: rest671)) => let
 val  result = MlyValue.Expr_simples (fn _ => let val  (Expr_simples
 as Expr_simples1) = Expr_simples1 ()
 in (Prim1("print",Expr_simples))
end)
 in ( LrTable.NT 4, ( result, PRINT1left, Expr_simples1right), rest671
)
end
|  ( 18, ( ( _, ( MlyValue.Expr_simples Expr_simples2, _, 
Expr_simples2right)) :: _ :: ( _, ( MlyValue.Expr_simples 
Expr_simples1, Expr_simples1left, _)) :: rest671)) => let val  result
 = MlyValue.Expr_simples (fn _ => let val  Expr_simples1 = 
Expr_simples1 ()
 val  Expr_simples2 = Expr_simples2 ()
 in (Prim2("&&",Expr_simples1,Expr_simples2))
end)
 in ( LrTable.NT 4, ( result, Expr_simples1left, Expr_simples2right), 
rest671)
end
|  ( 19, ( ( _, ( MlyValue.Expr_simples Expr_simples2, _, 
Expr_simples2right)) :: _ :: ( _, ( MlyValue.Expr_simples 
Expr_simples1, Expr_simples1left, _)) :: rest671)) => let val  result
 = MlyValue.Expr_simples (fn _ => let val  Expr_simples1 = 
Expr_simples1 ()
 val  Expr_simples2 = Expr_simples2 ()
 in (Prim2("+",Expr_simples1,Expr_simples2))
end)
 in ( LrTable.NT 4, ( result, Expr_simples1left, Expr_simples2right), 
rest671)
end
|  ( 20, ( ( _, ( MlyValue.Expr_simples Expr_simples2, _, 
Expr_simples2right)) :: _ :: ( _, ( MlyValue.Expr_simples 
Expr_simples1, Expr_simples1left, _)) :: rest671)) => let val  result
 = MlyValue.Expr_simples (fn _ => let val  Expr_simples1 = 
Expr_simples1 ()
 val  Expr_simples2 = Expr_simples2 ()
 in (Prim2("-",Expr_simples1,Expr_simples2))
end)
 in ( LrTable.NT 4, ( result, Expr_simples1left, Expr_simples2right), 
rest671)
end
|  ( 21, ( ( _, ( MlyValue.Expr_simples Expr_simples2, _, 
Expr_simples2right)) :: _ :: ( _, ( MlyValue.Expr_simples 
Expr_simples1, Expr_simples1left, _)) :: rest671)) => let val  result
 = MlyValue.Expr_simples (fn _ => let val  Expr_simples1 = 
Expr_simples1 ()
 val  Expr_simples2 = Expr_simples2 ()
 in (Prim2("*",Expr_simples1,Expr_simples2))
end)
 in ( LrTable.NT 4, ( result, Expr_simples1left, Expr_simples2right), 
rest671)
end
|  ( 22, ( ( _, ( MlyValue.Expr_simples Expr_simples2, _, 
Expr_simples2right)) :: _ :: ( _, ( MlyValue.Expr_simples 
Expr_simples1, Expr_simples1left, _)) :: rest671)) => let val  result
 = MlyValue.Expr_simples (fn _ => let val  Expr_simples1 = 
Expr_simples1 ()
 val  Expr_simples2 = Expr_simples2 ()
 in (Prim2("/",Expr_simples1,Expr_simples2))
end)
 in ( LrTable.NT 4, ( result, Expr_simples1left, Expr_simples2right), 
rest671)
end
|  ( 23, ( ( _, ( MlyValue.Expr_simples Expr_simples2, _, 
Expr_simples2right)) :: _ :: ( _, ( MlyValue.Expr_simples 
Expr_simples1, Expr_simples1left, _)) :: rest671)) => let val  result
 = MlyValue.Expr_simples (fn _ => let val  Expr_simples1 = 
Expr_simples1 ()
 val  Expr_simples2 = Expr_simples2 ()
 in (Prim2("=",Expr_simples1,Expr_simples2))
end)
 in ( LrTable.NT 4, ( result, Expr_simples1left, Expr_simples2right), 
rest671)
end
|  ( 24, ( ( _, ( MlyValue.Expr_simples Expr_simples2, _, 
Expr_simples2right)) :: _ :: ( _, ( MlyValue.Expr_simples 
Expr_simples1, Expr_simples1left, _)) :: rest671)) => let val  result
 = MlyValue.Expr_simples (fn _ => let val  Expr_simples1 = 
Expr_simples1 ()
 val  Expr_simples2 = Expr_simples2 ()
 in (Prim2("!=",Expr_simples1,Expr_simples2))
end)
 in ( LrTable.NT 4, ( result, Expr_simples1left, Expr_simples2right), 
rest671)
end
|  ( 25, ( ( _, ( MlyValue.Expr_simples Expr_simples2, _, 
Expr_simples2right)) :: _ :: ( _, ( MlyValue.Expr_simples 
Expr_simples1, Expr_simples1left, _)) :: rest671)) => let val  result
 = MlyValue.Expr_simples (fn _ => let val  Expr_simples1 = 
Expr_simples1 ()
 val  Expr_simples2 = Expr_simples2 ()
 in (Prim2("<",Expr_simples1,Expr_simples2))
end)
 in ( LrTable.NT 4, ( result, Expr_simples1left, Expr_simples2right), 
rest671)
end
|  ( 26, ( ( _, ( MlyValue.Expr_simples Expr_simples2, _, 
Expr_simples2right)) :: _ :: ( _, ( MlyValue.Expr_simples 
Expr_simples1, Expr_simples1left, _)) :: rest671)) => let val  result
 = MlyValue.Expr_simples (fn _ => let val  Expr_simples1 = 
Expr_simples1 ()
 val  Expr_simples2 = Expr_simples2 ()
 in (Prim2("<=",Expr_simples1,Expr_simples2))
end)
 in ( LrTable.NT 4, ( result, Expr_simples1left, Expr_simples2right), 
rest671)
end
|  ( 27, ( ( _, ( MlyValue.Expr_simples Expr_simples2, _, 
Expr_simples2right)) :: _ :: ( _, ( MlyValue.Expr_simples 
Expr_simples1, Expr_simples1left, _)) :: rest671)) => let val  result
 = MlyValue.Expr_simples (fn _ => let val  Expr_simples1 = 
Expr_simples1 ()
 val  Expr_simples2 = Expr_simples2 ()
 in (Prim2("::",Expr_simples1,Expr_simples2))
end)
 in ( LrTable.NT 4, ( result, Expr_simples1left, Expr_simples2right), 
rest671)
end
|  ( 28, ( ( _, ( _, _, FECHA_COLCHETE1right)) :: ( _, ( MlyValue.Num 
Num1, _, _)) :: _ :: ( _, ( MlyValue.Expr_simples Expr_simples1, 
Expr_simples1left, _)) :: rest671)) => let val  result = 
MlyValue.Expr_simples (fn _ => let val  (Expr_simples as Expr_simples1
) = Expr_simples1 ()
 val  (Num as Num1) = Num1 ()
 in (Item(Num,Expr_simples))
end)
 in ( LrTable.NT 4, ( result, Expr_simples1left, FECHA_COLCHETE1right)
, rest671)
end
|  ( 29, ( ( _, ( _, _, FECHA_PARENTESES1right)) :: ( _, ( _, 
ABRE_PARENTESES1left, _)) :: rest671)) => let val  result = 
MlyValue.Args (fn _ => ([]))
 in ( LrTable.NT 5, ( result, ABRE_PARENTESES1left, 
FECHA_PARENTESES1right), rest671)
end
|  ( 30, ( ( _, ( _, _, FECHA_PARENTESES1right)) :: ( _, ( 
MlyValue.Params Params1, _, _)) :: ( _, ( _, ABRE_PARENTESES1left, _))
 :: rest671)) => let val  result = MlyValue.Args (fn _ => let val  (
Params as Params1) = Params1 ()
 in (Params)
end)
 in ( LrTable.NT 5, ( result, ABRE_PARENTESES1left, 
FECHA_PARENTESES1right), rest671)
end
|  ( 31, ( ( _, ( MlyValue.Typed_var Typed_var1, Typed_var1left, 
Typed_var1right)) :: rest671)) => let val  result = MlyValue.Params
 (fn _ => let val  (Typed_var as Typed_var1) = Typed_var1 ()
 in ([Typed_var])
end)
 in ( LrTable.NT 6, ( result, Typed_var1left, Typed_var1right), 
rest671)
end
|  ( 32, ( ( _, ( MlyValue.Params Params1, _, Params1right)) :: _ :: (
 _, ( MlyValue.Typed_var Typed_var1, Typed_var1left, _)) :: rest671))
 => let val  result = MlyValue.Params (fn _ => let val  (Typed_var as 
Typed_var1) = Typed_var1 ()
 val  (Params as Params1) = Params1 ()
 in (Typed_var::Params)
end)
 in ( LrTable.NT 6, ( result, Typed_var1left, Params1right), rest671)

end
|  ( 33, ( ( _, ( MlyValue.Id Id1, _, Id1right)) :: ( _, ( 
MlyValue.Type Type1, Type1left, _)) :: rest671)) => let val  result = 
MlyValue.Typed_var (fn _ => let val  (Type as Type1) = Type1 ()
 val  (Id as Id1) = Id1 ()
 in ((Type,Id))
end)
 in ( LrTable.NT 7, ( result, Type1left, Id1right), rest671)
end
|  ( 34, ( ( _, ( MlyValue.Atomic_type Atomic_type1, Atomic_type1left,
 Atomic_type1right)) :: rest671)) => let val  result = MlyValue.Type
 (fn _ => let val  (Atomic_type as Atomic_type1) = Atomic_type1 ()
 in (Atomic_type)
end)
 in ( LrTable.NT 8, ( result, Atomic_type1left, Atomic_type1right), 
rest671)
end
|  ( 35, ( ( _, ( _, _, FECHA_PARENTESES1right)) :: ( _, ( 
MlyValue.Types Types1, _, _)) :: ( _, ( _, ABRE_PARENTESES1left, _))
 :: rest671)) => let val  result = MlyValue.Type (fn _ => let val  (
Types as Types1) = Types1 ()
 in (Types)
end)
 in ( LrTable.NT 8, ( result, ABRE_PARENTESES1left, 
FECHA_PARENTESES1right), rest671)
end
|  ( 36, ( ( _, ( _, _, FECHA_COLCHETE1right)) :: ( _, ( MlyValue.Type
 Type1, _, _)) :: ( _, ( _, ABRE_COLCHETE1left, _)) :: rest671)) =>
 let val  result = MlyValue.Type (fn _ => let val  (Type as Type1) = 
Type1 ()
 in (SeqT Type)
end)
 in ( LrTable.NT 8, ( result, ABRE_COLCHETE1left, FECHA_COLCHETE1right
), rest671)
end
|  ( 37, ( ( _, ( MlyValue.Type Type2, _, Type2right)) :: _ :: ( _, ( 
MlyValue.Type Type1, Type1left, _)) :: rest671)) => let val  result = 
MlyValue.Type (fn _ => let val  Type1 = Type1 ()
 val  Type2 = Type2 ()
 in (FunT (Type1,Type2))
end)
 in ( LrTable.NT 8, ( result, Type1left, Type2right), rest671)
end
|  ( 38, ( ( _, ( _, NIL1left, NIL1right)) :: rest671)) => let val  
result = MlyValue.Atomic_type (fn _ => (ListT []))
 in ( LrTable.NT 9, ( result, NIL1left, NIL1right), rest671)
end
|  ( 39, ( ( _, ( _, BOOL1left, BOOL1right)) :: rest671)) => let val  
result = MlyValue.Atomic_type (fn _ => (BoolT))
 in ( LrTable.NT 9, ( result, BOOL1left, BOOL1right), rest671)
end
|  ( 40, ( ( _, ( _, INT1left, INT1right)) :: rest671)) => let val  
result = MlyValue.Atomic_type (fn _ => (IntT))
 in ( LrTable.NT 9, ( result, INT1left, INT1right), rest671)
end
|  ( 41, ( ( _, ( _, _, FECHA_PARENTESES1right)) :: ( _, ( 
MlyValue.Type Type1, _, _)) :: ( _, ( _, ABRE_PARENTESES1left, _)) :: 
rest671)) => let val  result = MlyValue.Atomic_type (fn _ => let val 
 (Type as Type1) = Type1 ()
 in (Type)
end)
 in ( LrTable.NT 9, ( result, ABRE_PARENTESES1left, 
FECHA_PARENTESES1right), rest671)
end
|  ( 42, ( ( _, ( MlyValue.Type Type2, _, Type2right)) :: _ :: ( _, ( 
MlyValue.Type Type1, Type1left, _)) :: rest671)) => let val  result = 
MlyValue.Types (fn _ => let val  Type1 = Type1 ()
 val  Type2 = Type2 ()
 in (ListT ((quebra_plcType_list Type1)@(quebra_plcType_list Type2)))

end)
 in ( LrTable.NT 10, ( result, Type1left, Type2right), rest671)
end
|  ( 43, ( ( _, ( MlyValue.Types Types1, _, Types1right)) :: _ :: ( _,
 ( MlyValue.Type Type1, Type1left, _)) :: rest671)) => let val  result
 = MlyValue.Types (fn _ => let val  (Type as Type1) = Type1 ()
 val  (Types as Types1) = Types1 ()
 in (ListT ((quebra_plcType_list Type)@(quebra_plcType_list Types)))

end)
 in ( LrTable.NT 10, ( result, Type1left, Types1right), rest671)
end
|  ( 44, ( ( _, ( MlyValue.Const Const1, Const1left, Const1right)) :: 
rest671)) => let val  result = MlyValue.Atomic_expr (fn _ => let val 
 (Const as Const1) = Const1 ()
 in (Const)
end)
 in ( LrTable.NT 11, ( result, Const1left, Const1right), rest671)
end
|  ( 45, ( ( _, ( MlyValue.Id Id1, Id1left, Id1right)) :: rest671)) =>
 let val  result = MlyValue.Atomic_expr (fn _ => let val  (Id as Id1)
 = Id1 ()
 in (Var Id)
end)
 in ( LrTable.NT 11, ( result, Id1left, Id1right), rest671)
end
|  ( 46, ( ( _, ( _, _, FECHA_CHAVE1right)) :: ( _, ( MlyValue.Prog 
Prog1, _, _)) :: ( _, ( _, ABRE_CHAVE1left, _)) :: rest671)) => let
 val  result = MlyValue.Atomic_expr (fn _ => let val  (Prog as Prog1)
 = Prog1 ()
 in (Prog)
end)
 in ( LrTable.NT 11, ( result, ABRE_CHAVE1left, FECHA_CHAVE1right), 
rest671)
end
|  ( 47, ( ( _, ( _, _, FECHA_PARENTESES1right)) :: ( _, ( 
MlyValue.Expr_simples Expr_simples1, _, _)) :: ( _, ( _, 
ABRE_PARENTESES1left, _)) :: rest671)) => let val  result = 
MlyValue.Atomic_expr (fn _ => let val  (Expr_simples as Expr_simples1)
 = Expr_simples1 ()
 in (Expr_simples)
end)
 in ( LrTable.NT 11, ( result, ABRE_PARENTESES1left, 
FECHA_PARENTESES1right), rest671)
end
|  ( 48, ( ( _, ( _, _, FECHA_PARENTESES1right)) :: ( _, ( 
MlyValue.Comps Comps1, _, _)) :: ( _, ( _, ABRE_PARENTESES1left, _))
 :: rest671)) => let val  result = MlyValue.Atomic_expr (fn _ => let
 val  (Comps as Comps1) = Comps1 ()
 in (List Comps)
end)
 in ( LrTable.NT 11, ( result, ABRE_PARENTESES1left, 
FECHA_PARENTESES1right), rest671)
end
|  ( 49, ( ( _, ( _, _, END1right)) :: ( _, ( MlyValue.Expr_simples 
Expr_simples1, _, _)) :: _ :: _ :: ( _, ( MlyValue.Args Args1, _, _))
 :: ( _, ( _, FN1left, _)) :: rest671)) => let val  result = 
MlyValue.Atomic_expr (fn _ => let val  (Args as Args1) = Args1 ()
 val  (Expr_simples as Expr_simples1) = Expr_simples1 ()
 in (makeAnon(Args,Expr_simples))
end)
 in ( LrTable.NT 11, ( result, FN1left, END1right), rest671)
end
|  ( 50, ( ( _, ( MlyValue.Expr_simples Expr_simples2, _, 
Expr_simples2right)) :: _ :: ( _, ( MlyValue.Expr_simples 
Expr_simples1, Expr_simples1left, _)) :: rest671)) => let val  result
 = MlyValue.Comps (fn _ => let val  Expr_simples1 = Expr_simples1 ()
 val  Expr_simples2 = Expr_simples2 ()
 in ([Expr_simples1,Expr_simples2])
end)
 in ( LrTable.NT 14, ( result, Expr_simples1left, Expr_simples2right),
 rest671)
end
|  ( 51, ( ( _, ( MlyValue.Comps Comps1, _, Comps1right)) :: _ :: ( _,
 ( MlyValue.Expr_simples Expr_simples1, Expr_simples1left, _)) :: 
rest671)) => let val  result = MlyValue.Comps (fn _ => let val  (
Expr_simples as Expr_simples1) = Expr_simples1 ()
 val  (Comps as Comps1) = Comps1 ()
 in (Expr_simples::Comps)
end)
 in ( LrTable.NT 14, ( result, Expr_simples1left, Comps1right), 
rest671)
end
|  ( 52, ( ( _, ( MlyValue.Atomic_expr Atomic_expr2, _, 
Atomic_expr2right)) :: ( _, ( MlyValue.Atomic_expr Atomic_expr1, 
Atomic_expr1left, _)) :: rest671)) => let val  result = 
MlyValue.App_expr (fn _ => let val  Atomic_expr1 = Atomic_expr1 ()
 val  Atomic_expr2 = Atomic_expr2 ()
 in (Call(Atomic_expr1,Atomic_expr2))
end)
 in ( LrTable.NT 12, ( result, Atomic_expr1left, Atomic_expr2right), 
rest671)
end
|  ( 53, ( ( _, ( MlyValue.Atomic_expr Atomic_expr1, _, 
Atomic_expr1right)) :: ( _, ( MlyValue.App_expr App_expr1, 
App_expr1left, _)) :: rest671)) => let val  result = MlyValue.App_expr
 (fn _ => let val  (App_expr as App_expr1) = App_expr1 ()
 val  (Atomic_expr as Atomic_expr1) = Atomic_expr1 ()
 in (Call(App_expr,Atomic_expr))
end)
 in ( LrTable.NT 12, ( result, App_expr1left, Atomic_expr1right), 
rest671)
end
|  ( 54, ( ( _, ( _, TRUE1left, TRUE1right)) :: rest671)) => let val  
result = MlyValue.Const (fn _ => (ConB true))
 in ( LrTable.NT 13, ( result, TRUE1left, TRUE1right), rest671)
end
|  ( 55, ( ( _, ( _, FALSE1left, FALSE1right)) :: rest671)) => let
 val  result = MlyValue.Const (fn _ => (ConB false))
 in ( LrTable.NT 13, ( result, FALSE1left, FALSE1right), rest671)
end
|  ( 56, ( ( _, ( MlyValue.Num Num1, Num1left, Num1right)) :: rest671)
) => let val  result = MlyValue.Const (fn _ => let val  (Num as Num1)
 = Num1 ()
 in (ConI Num)
end)
 in ( LrTable.NT 13, ( result, Num1left, Num1right), rest671)
end
|  ( 57, ( ( _, ( _, _, FECHA_PARENTESES1right)) :: ( _, ( _, 
ABRE_PARENTESES1left, _)) :: rest671)) => let val  result = 
MlyValue.Const (fn _ => (List []))
 in ( LrTable.NT 13, ( result, ABRE_PARENTESES1left, 
FECHA_PARENTESES1right), rest671)
end
|  ( 58, ( ( _, ( _, _, FECHA_PARENTESES1right)) :: _ :: _ :: ( _, ( 
MlyValue.Type Type1, _, _)) :: ( _, ( _, ABRE_PARENTESES1left, _)) :: 
rest671)) => let val  result = MlyValue.Const (fn _ => let val  (Type
 as Type1) = Type1 ()
 in (ESeq Type)
end)
 in ( LrTable.NT 13, ( result, ABRE_PARENTESES1left, 
FECHA_PARENTESES1right), rest671)
end
|  ( 59, ( ( _, ( _, END1left, END1right)) :: rest671)) => let val  
result = MlyValue.Match_expr (fn _ => ([]))
 in ( LrTable.NT 15, ( result, END1left, END1right), rest671)
end
|  ( 60, ( ( _, ( MlyValue.Match_expr Match_expr1, _, Match_expr1right
)) :: ( _, ( MlyValue.Expr_simples Expr_simples2, _, _)) :: _ :: ( _, 
( MlyValue.Expr_simples Expr_simples1, _, _)) :: ( _, ( _, 
BARRA_VERTICAL1left, _)) :: rest671)) => let val  result = 
MlyValue.Match_expr (fn _ => let val  Expr_simples1 = Expr_simples1 ()
 val  Expr_simples2 = Expr_simples2 ()
 val  (Match_expr as Match_expr1) = Match_expr1 ()
 in ((SOME (Expr_simples1),Expr_simples2)::Match_expr)
end)
 in ( LrTable.NT 15, ( result, BARRA_VERTICAL1left, Match_expr1right),
 rest671)
end
|  ( 61, ( ( _, ( MlyValue.Match_expr Match_expr1, _, Match_expr1right
)) :: ( _, ( MlyValue.Expr_simples Expr_simples1, _, _)) :: _ :: _ :: 
( _, ( _, BARRA_VERTICAL1left, _)) :: rest671)) => let val  result = 
MlyValue.Match_expr (fn _ => let val  (Expr_simples as Expr_simples1)
 = Expr_simples1 ()
 val  (Match_expr as Match_expr1) = Match_expr1 ()
 in ((NONE,Expr_simples)::Match_expr)
end)
 in ( LrTable.NT 15, ( result, BARRA_VERTICAL1left, Match_expr1right),
 rest671)
end
|  ( 62, ( ( _, ( MlyValue.NUM NUM1, NUM1left, NUM1right)) :: rest671)
) => let val  result = MlyValue.Num (fn _ => let val  (NUM as NUM1) = 
NUM1 ()
 in (NUM)
end)
 in ( LrTable.NT 17, ( result, NUM1left, NUM1right), rest671)
end
|  ( 63, ( ( _, ( MlyValue.ID ID1, ID1left, ID1right)) :: rest671)) =>
 let val  result = MlyValue.Id (fn _ => let val  (ID as ID1) = ID1 ()
 in (ID)
end)
 in ( LrTable.NT 16, ( result, ID1left, ID1right), rest671)
end
| _ => raise (mlyAction i392)
end
val void = MlyValue.VOID
val extract = fn a => (fn MlyValue.Start x => x
| _ => let exception ParseInternal
	in raise ParseInternal end) a ()
end
end
structure Tokens : PlcParser_TOKENS =
struct
type svalue = ParserData.svalue
type ('a,'b) token = ('a,'b) Token.token
fun NUM (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 0,(
ParserData.MlyValue.NUM (fn () => i),p1,p2))
fun ID (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 1,(
ParserData.MlyValue.ID (fn () => i),p1,p2))
fun EOF (p1,p2) = Token.TOKEN (ParserData.LrTable.T 2,(
ParserData.MlyValue.VOID,p1,p2))
fun VAR (p1,p2) = Token.TOKEN (ParserData.LrTable.T 3,(
ParserData.MlyValue.VOID,p1,p2))
fun FUN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 4,(
ParserData.MlyValue.VOID,p1,p2))
fun REC (p1,p2) = Token.TOKEN (ParserData.LrTable.T 5,(
ParserData.MlyValue.VOID,p1,p2))
fun IF (p1,p2) = Token.TOKEN (ParserData.LrTable.T 6,(
ParserData.MlyValue.VOID,p1,p2))
fun THEN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 7,(
ParserData.MlyValue.VOID,p1,p2))
fun ELSE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 8,(
ParserData.MlyValue.VOID,p1,p2))
fun MATCH (p1,p2) = Token.TOKEN (ParserData.LrTable.T 9,(
ParserData.MlyValue.VOID,p1,p2))
fun WITH (p1,p2) = Token.TOKEN (ParserData.LrTable.T 10,(
ParserData.MlyValue.VOID,p1,p2))
fun HD (p1,p2) = Token.TOKEN (ParserData.LrTable.T 11,(
ParserData.MlyValue.VOID,p1,p2))
fun TL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 12,(
ParserData.MlyValue.VOID,p1,p2))
fun ISE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 13,(
ParserData.MlyValue.VOID,p1,p2))
fun PRINT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 14,(
ParserData.MlyValue.VOID,p1,p2))
fun FN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 15,(
ParserData.MlyValue.VOID,p1,p2))
fun END (p1,p2) = Token.TOKEN (ParserData.LrTable.T 16,(
ParserData.MlyValue.VOID,p1,p2))
fun TRUE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 17,(
ParserData.MlyValue.VOID,p1,p2))
fun FALSE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 18,(
ParserData.MlyValue.VOID,p1,p2))
fun NIL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 19,(
ParserData.MlyValue.VOID,p1,p2))
fun BOOL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 20,(
ParserData.MlyValue.VOID,p1,p2))
fun INT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 21,(
ParserData.MlyValue.VOID,p1,p2))
fun PONTO_VIRGULA (p1,p2) = Token.TOKEN (ParserData.LrTable.T 22,(
ParserData.MlyValue.VOID,p1,p2))
fun IGUAL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 23,(
ParserData.MlyValue.VOID,p1,p2))
fun DIFERENTE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 24,(
ParserData.MlyValue.VOID,p1,p2))
fun DOIS_PONTOS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 25,(
ParserData.MlyValue.VOID,p1,p2))
fun DUPLO_DOIS_PONTOS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 26,(
ParserData.MlyValue.VOID,p1,p2))
fun EXCLAMACAO (p1,p2) = Token.TOKEN (ParserData.LrTable.T 27,(
ParserData.MlyValue.VOID,p1,p2))
fun MENOS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 28,(
ParserData.MlyValue.VOID,p1,p2))
fun MENOS_MAIOR (p1,p2) = Token.TOKEN (ParserData.LrTable.T 29,(
ParserData.MlyValue.VOID,p1,p2))
fun DUPLO_E_COMERCIAL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 30,(
ParserData.MlyValue.VOID,p1,p2))
fun MAIS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 31,(
ParserData.MlyValue.VOID,p1,p2))
fun VEZES (p1,p2) = Token.TOKEN (ParserData.LrTable.T 32,(
ParserData.MlyValue.VOID,p1,p2))
fun DIVIDIDO (p1,p2) = Token.TOKEN (ParserData.LrTable.T 33,(
ParserData.MlyValue.VOID,p1,p2))
fun MENOR (p1,p2) = Token.TOKEN (ParserData.LrTable.T 34,(
ParserData.MlyValue.VOID,p1,p2))
fun MAIOR (p1,p2) = Token.TOKEN (ParserData.LrTable.T 35,(
ParserData.MlyValue.VOID,p1,p2))
fun MENOR_IGUAL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 36,(
ParserData.MlyValue.VOID,p1,p2))
fun ABRE_COLCHETE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 37,(
ParserData.MlyValue.VOID,p1,p2))
fun FECHA_COLCHETE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 38,(
ParserData.MlyValue.VOID,p1,p2))
fun ABRE_PARENTESES (p1,p2) = Token.TOKEN (ParserData.LrTable.T 39,(
ParserData.MlyValue.VOID,p1,p2))
fun FECHA_PARENTESES (p1,p2) = Token.TOKEN (ParserData.LrTable.T 40,(
ParserData.MlyValue.VOID,p1,p2))
fun ABRE_CHAVE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 41,(
ParserData.MlyValue.VOID,p1,p2))
fun FECHA_CHAVE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 42,(
ParserData.MlyValue.VOID,p1,p2))
fun VIRGULA (p1,p2) = Token.TOKEN (ParserData.LrTable.T 43,(
ParserData.MlyValue.VOID,p1,p2))
fun BARRA_VERTICAL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 44,(
ParserData.MlyValue.VOID,p1,p2))
fun UNDERLINE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 45,(
ParserData.MlyValue.VOID,p1,p2))
end
end
