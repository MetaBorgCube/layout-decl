Module("libspoofax/editor/outline",[Imports([Import("libspoofax/term/origin"),Import("libspoofax/term/annotation")]),Signature([Constructors([OpDecl("Node",FunType([ConstType(SortNoArgs("Label")),ConstType(SortNoArgs("Children"))],ConstType(SortNoArgs("Node"))))])]),Rules([SDefT("simple-label-outline",[VarDec("s1",ConstType(SortNoArgs("ATerm")))],[],CallT(SVar("collect-om"),[CallT(SVar("to-outline-node"),[CallT(SVar("s1"),[],[]),Fail],[]),CallT(SVar("conc"),[],[])],[])),SDefT("custom-label-outline",[VarDec("s1",ConstType(SortNoArgs("ATerm"))),VarDec("s2",ConstType(SortNoArgs("ATerm")))],[],CallT(SVar("collect-om"),[GuardedLChoice(CallT(SVar("origin-track-forced"),[CallT(SVar("s2"),[],[])],[]),Id,CallT(SVar("to-outline-node"),[CallT(SVar("s1"),[],[]),CallT(SVar("s2"),[],[])],[])),CallT(SVar("conc"),[],[])],[])),SDefT("to-outline-node",[VarDec("s1",ConstType(SortNoArgs("ATerm"))),VarDec("s2",ConstType(SortNoArgs("ATerm")))],[],SRule(Rule(Var("term"),NoAnnoList(Op("Node",[Var("label"),Var("children")])),[WhereClause(Seq(Assign(Var("random"),RootApp(CallT(SVar("next-random"),[],[]))),Seq(Assign(Var("label"),App(CallT(SVar("origin-track-forced"),[Seq(CallT(SVar("s1"),[],[]),Seq(CallT(SVar("term-to-outline-label"),[],[]),Seq(CallT(SVar("add-annotation"),[],[Var("random")]),CallT(SVar("remove-annotations"),[Match(Var("random"))],[]))))],[]),Var("term"))),Assign(Var("children"),App(Seq(CallT(SVar("get-arguments"),[],[]),CallT(SVar("custom-label-outline"),[CallT(SVar("s1"),[],[]),CallT(SVar("s2"),[],[])],[])),Var("term"))))))]))),SDefT("term-to-outline-label",[],[],GuardedLChoice(CallT(SVar("is-string"),[],[]),Id,GuardedLChoice(Seq(Match(AnnoList(Var("term"),[Var("a")])),Seq(CallT(SVar("origin-text"),[],[]),Seq(Match(Var("label")),Build(AnnoList(Var("label"),[Var("a")]))))),Id,CallT(SVar("write-to-string"),[],[]))))]),Rules([SDefT("literals-to-outline-label",[],[VarDec("term",ConstType(SortNoArgs("ATerm")))],SRule(Rule(Var("literals"),Var("literals"),[WhereClause(Seq(Assign(Var("literals'"),App(CallT(SVar("split-at-space"),[],[]),Var("literals"))),Seq(Assign(NoAnnoList(Tuple([Var("a"),Var("b"),Var("c"),Var("d"),Var("e")])),App(CallT(SVar("origin-location-offset"),[],[]),Var("term"))),Seq(Assign(NoAnnoList(Tuple([Var("before"),Var("after")])),App(CallT(SVar("split-before"),[],[]),NoAnnoList(Tuple([App(CallT(SVar("origin-text"),[],[]),Var("term")),App(CallT(SVar("Hd"),[],[]),Var("literals'"))])))),Seq(Assign(Var("start-offset"),App(CallT(SVar("add"),[],[]),NoAnnoList(Tuple([Var("d"),App(CallT(SVar("string-length"),[],[]),Var("before"))])))),Seq(Assign(Var("end-offset"),App(CallT(SVar("get-literals-end-offset"),[],[Var("literals'"),Var("start-offset")]),Var("after"))),BA(CallT(SVar("origin-location-offset-set"),[],[NoAnnoList(Tuple([Var("a"),Var("b"),Var("c"),Var("start-offset"),Var("end-offset")]))]),Var("literals"))))))))]))),SDefT("get-literals-end-offset",[],[VarDec("literals",ConstType(SortNoArgs("ATerm"))),VarDec("start-offset",ConstType(SortNoArgs("ATerm")))],SRule(Rule(Var("text"),Var("end-offset"),[WhereClause(Seq(Assign(NoAnnoList(Tuple([Var("before"),Var("after")])),App(CallT(SVar("split-after"),[],[]),NoAnnoList(Tuple([Var("text"),App(CallT(SVar("Hd"),[],[]),Var("literals"))])))),Assign(Var("end-offset"),App(CallT(SVar("get-literals-end-offset"),[],[App(CallT(SVar("Tl"),[],[]),Var("literals")),App(CallT(SVar("add"),[],[]),NoAnnoList(Tuple([Var("start-offset"),App(CallT(SVar("string-length"),[],[]),Var("before"))])))]),Var("after")))))]))),SDefT("get-literals-end-offset",[],[VarDec("literals",ConstType(SortNoArgs("ATerm"))),VarDec("start-offset",ConstType(SortNoArgs("ATerm")))],SRule(Rule(Wld,App(CallT(SVar("dec"),[],[]),Var("start-offset")),[WhereClause(Assign(NoAnnoList(List([])),Var("literals")))])))]),Rules([SDefT("origin-text-at-start",[],[],SRule(Rule(Var("term"),Var("result'"),[WhereClause(Seq(Assign(NoAnnoList(Tuple([Var("cons"),Var("args")])),App(CallT(SVar("explode-term"),[],[]),Var("term"))),Seq(Assign(Var("offset1"),App(Seq(CallT(SVar("origin-offset"),[],[]),Match(NoAnnoList(Tuple([RootApp(Id),Wld])))),Var("term"))),Seq(Assign(Var("offset2"),App(Seq(CallT(SVar("Hd"),[],[]),Seq(CallT(SVar("origin-offset"),[],[]),Match(NoAnnoList(Tuple([RootApp(Id),Wld]))))),Var("args"))),Seq(Assign(Var("offset-diff"),App(CallT(SVar("subt"),[],[]),NoAnnoList(Tuple([Var("offset2"),Var("offset1")])))),GuardedLChoice(Where(Assign(NoAnnoList(Int("0")),Var("offset-diff"))),Assign(Var("result'"),App(Seq(CallT(SVar("Hd"),[],[]),Seq(CallT(SVar("origin-text"),[],[]),CallT(SVar("guarantee-one-space-separation"),[],[]))),Var("args"))),Seq(Assign(Var("result"),App(Seq(CallT(SVar("origin-text"),[],[]),Seq(CallT(SVar("explode-string"),[],[]),Seq(CallT(SVar("take"),[Build(Var("offset-diff"))],[]),Seq(CallT(SVar("rtrim"),[GuardedLChoice(CallT(SVar("is-whitespace"),[],[]),Id,Test(CharCong("'\\n'")))],[]),CallT(SVar("implode-string"),[],[]))))),Var("term"))),Seq(Assign(Var("result'"),App(CallT(SVar("guarantee-one-space-separation"),[],[]),Var("result"))),Seq(Assign(NoAnnoList(Tuple([Var("a"),Var("b"),Var("c"),Var("d"),Var("e")])),App(CallT(SVar("origin-location-offset"),[],[]),Var("term"))),BA(CallT(SVar("origin-location-offset-set"),[],[NoAnnoList(Tuple([Var("a"),Var("b"),Var("c"),Var("d"),App(CallT(SVar("add"),[],[]),NoAnnoList(Tuple([Var("d"),App(Seq(CallT(SVar("string-length"),[],[]),CallT(SVar("dec"),[],[])),Var("result"))])))]))]),Var("result'")))))))))))]))),SDefT("guarantee-one-space-separation",[],[],CallT(SVar("string-as-chars"),[Seq(CallT(SVar("map"),[CallT(SVar("try"),[Seq(Test(GuardedLChoice(CharCong("'\\n'"),Id,CharCong("' '"))),Build(NoAnnoList(Char("' '"))))],[])],[]),CallT(SVar("foldr"),[Build(NoAnnoList(List([]))),GuardedLChoice(CallT(SVar("rm-double-space"),[],[]),Id,CallT(SVar("MkCons"),[],[]))],[]))],[])),SDefT("rm-double-space",[],[],SRule(Rule(NoAnnoList(Tuple([NoAnnoList(Char("' '")),As(Var("l"),NoAnnoList(ListTail([NoAnnoList(Char("' '"))],Var("xs"))))])),Var("l"),[])))])])