Module("completion/Haskell-Types-cp",[Imports([Import("libstratego-gpp"),ImportWildcard("libspoofax/editor/completion")]),Imports([Import("signatures/Haskell-Types-sig")]),Imports([Import("completion/Haskell-Identifier-Sorts-cp")]),Rules([SDefT("suggest-completions",[],[VarDec("completions",ConstType(SortNoArgs("ATerm")))],SRule(Rule(NoAnnoList(Op("OptSig-Plhdr",[])),App(Seq(CallT(SVar("add-completions"),[],[NoAnnoList(Tuple([NoAnnoList(Str("\"OptSig\"")),NoAnnoList(Op("OptSig",[NoAnnoList(Op("Some",[NoAnnoList(Op("CURSOR_ELEMENT",[]))]))]))]))]),Fail),Var("completions")),[]))),SDefT("suggest-completions",[],[VarDec("completions",ConstType(SortNoArgs("ATerm")))],SRule(Rule(NoAnnoList(Op("Seq1-Plhdr",[])),App(Seq(CallT(SVar("add-completions"),[],[NoAnnoList(Tuple([NoAnnoList(Str("\"Seq\"")),NoAnnoList(Op("Seq",[App(CallT(SVar("try"),[CallT(SVar("inline-completions"),[],[NoAnnoList(Op("Seq1-Plhdr",[]))])],[]),NoAnnoList(Op("Type-Plhdr",[])))]))]))]),Fail),Var("completions")),[]))),SDefT("suggest-completions",[],[VarDec("completions",ConstType(SortNoArgs("ATerm")))],SRule(Rule(NoAnnoList(Op("Gtycon-Plhdr",[])),App(CallT(SVar("suggest-completions"),[],[Var("completions")]),NoAnnoList(Op("Qtycon-Plhdr",[]))),[WhereClause(Seq(BA(Not(CallT(SVar("is-expanded"),[],[])),NoAnnoList(Tuple([NoAnnoList(Op("Gtycon-Plhdr",[])),NoAnnoList(Op("Qtycon-Plhdr",[]))]))),GenDynRules([SetDynRule(DynRuleId(RDecT("is-expanded",[],[])),Rule(NoAnnoList(Tuple([NoAnnoList(Op("Gtycon-Plhdr",[])),NoAnnoList(Op("Qtycon-Plhdr",[]))])),RootApp(Id),[]))])))]))),SDefT("suggest-completions",[],[VarDec("completions",ConstType(SortNoArgs("ATerm")))],SRule(Rule(NoAnnoList(Op("Gtycon-Plhdr",[])),App(Seq(CallT(SVar("add-completions"),[],[NoAnnoList(Tuple([NoAnnoList(Str("\"TArrow\"")),NoAnnoList(Op("TArrow",[]))]))]),Fail),Var("completions")),[]))),SDefT("suggest-completions",[],[VarDec("completions",ConstType(SortNoArgs("ATerm")))],SRule(Rule(NoAnnoList(Op("Types-Plhdr",[])),App(Seq(CallT(SVar("add-completions"),[],[NoAnnoList(Tuple([NoAnnoList(Str("\"TypesList\"")),NoAnnoList(Op("TypesList",[NoAnnoList(List([App(CallT(SVar("try"),[CallT(SVar("inline-completions"),[],[NoAnnoList(Op("Types-Plhdr",[]))])],[]),NoAnnoList(Op("Type-Plhdr",[])))]))]))]))]),Fail),Var("completions")),[]))),SDefT("suggest-completions",[],[VarDec("completions",ConstType(SortNoArgs("ATerm")))],SRule(Rule(NoAnnoList(Op("Types2-Plhdr",[])),App(Seq(CallT(SVar("add-completions"),[],[NoAnnoList(Tuple([NoAnnoList(Str("\"Const\"")),NoAnnoList(Op("Const",[App(CallT(SVar("try"),[CallT(SVar("inline-completions"),[],[NoAnnoList(Op("Types2-Plhdr",[]))])],[]),NoAnnoList(Op("Type-Plhdr",[]))),NoAnnoList(List([App(CallT(SVar("try"),[CallT(SVar("inline-completions"),[],[NoAnnoList(Op("Types2-Plhdr",[]))])],[]),NoAnnoList(Op("Type-Plhdr",[])))]))]))]))]),Fail),Var("completions")),[]))),SDefT("suggest-completions",[],[VarDec("completions",ConstType(SortNoArgs("ATerm")))],SRule(Rule(NoAnnoList(Op("AType-Plhdr",[])),App(Seq(CallT(SVar("add-completions"),[],[NoAnnoList(Tuple([NoAnnoList(Str("\"TCon\"")),NoAnnoList(Op("TCon",[App(CallT(SVar("try"),[CallT(SVar("inline-completions"),[],[NoAnnoList(Op("AType-Plhdr",[]))])],[]),NoAnnoList(Op("Gtycon-Plhdr",[])))]))]))]),Fail),Var("completions")),[]))),SDefT("suggest-completions",[],[VarDec("completions",ConstType(SortNoArgs("ATerm")))],SRule(Rule(NoAnnoList(Op("AType-Plhdr",[])),App(Seq(CallT(SVar("add-completions"),[],[NoAnnoList(Tuple([NoAnnoList(Str("\"TVar\"")),NoAnnoList(Op("TVar",[App(CallT(SVar("try"),[CallT(SVar("inline-completions"),[],[NoAnnoList(Op("AType-Plhdr",[]))])],[]),NoAnnoList(Op("Tyvar-Plhdr",[])))]))]))]),Fail),Var("completions")),[]))),SDefT("suggest-completions",[],[VarDec("completions",ConstType(SortNoArgs("ATerm")))],SRule(Rule(NoAnnoList(Op("AType-Plhdr",[])),App(Seq(CallT(SVar("add-completions"),[],[NoAnnoList(Tuple([NoAnnoList(Str("\"Type\"")),NoAnnoList(Op("Type",[App(CallT(SVar("try"),[CallT(SVar("inline-completions"),[],[NoAnnoList(Op("AType-Plhdr",[]))])],[]),NoAnnoList(Op("Type-Plhdr",[])))]))]))]),Fail),Var("completions")),[]))),SDefT("suggest-completions",[],[VarDec("completions",ConstType(SortNoArgs("ATerm")))],SRule(Rule(NoAnnoList(Op("AType-Plhdr",[])),App(Seq(CallT(SVar("add-completions"),[],[NoAnnoList(Tuple([NoAnnoList(Str("\"TList\"")),NoAnnoList(Op("TList",[App(CallT(SVar("try"),[CallT(SVar("inline-completions"),[],[NoAnnoList(Op("AType-Plhdr",[]))])],[]),NoAnnoList(Op("Type-Plhdr",[])))]))]))]),Fail),Var("completions")),[]))),SDefT("suggest-completions",[],[VarDec("completions",ConstType(SortNoArgs("ATerm")))],SRule(Rule(NoAnnoList(Op("AType-Plhdr",[])),App(Seq(CallT(SVar("add-completions"),[],[NoAnnoList(Tuple([NoAnnoList(Str("\"TProd\"")),NoAnnoList(Op("TProd",[App(CallT(SVar("try"),[CallT(SVar("inline-completions"),[],[NoAnnoList(Op("AType-Plhdr",[]))])],[]),NoAnnoList(Op("Types2-Plhdr",[])))]))]))]),Fail),Var("completions")),[]))),SDefT("suggest-completions",[],[VarDec("completions",ConstType(SortNoArgs("ATerm")))],SRule(Rule(NoAnnoList(Op("Type-Plhdr",[])),App(CallT(SVar("suggest-completions"),[],[Var("completions")]),NoAnnoList(Op("AType-Plhdr",[]))),[WhereClause(Seq(BA(Not(CallT(SVar("is-expanded"),[],[])),NoAnnoList(Tuple([NoAnnoList(Op("Type-Plhdr",[])),NoAnnoList(Op("AType-Plhdr",[]))]))),GenDynRules([SetDynRule(DynRuleId(RDecT("is-expanded",[],[])),Rule(NoAnnoList(Tuple([NoAnnoList(Op("Type-Plhdr",[])),NoAnnoList(Op("AType-Plhdr",[]))])),RootApp(Id),[]))])))]))),SDefT("suggest-completions",[],[VarDec("completions",ConstType(SortNoArgs("ATerm")))],SRule(Rule(NoAnnoList(Op("Type-Plhdr",[])),App(Seq(CallT(SVar("add-completions"),[],[NoAnnoList(Tuple([NoAnnoList(Str("\"TAppBin\"")),NoAnnoList(Op("TAppBin",[App(CallT(SVar("try"),[CallT(SVar("inline-completions"),[],[NoAnnoList(Op("Type-Plhdr",[]))])],[]),NoAnnoList(Op("Type-Plhdr",[]))),App(CallT(SVar("try"),[CallT(SVar("inline-completions"),[],[NoAnnoList(Op("Type-Plhdr",[]))])],[]),NoAnnoList(Op("Type-Plhdr",[])))]))]))]),Fail),Var("completions")),[]))),SDefT("suggest-completions",[],[VarDec("completions",ConstType(SortNoArgs("ATerm")))],SRule(Rule(NoAnnoList(Op("Type-Plhdr",[])),App(Seq(CallT(SVar("add-completions"),[],[NoAnnoList(Tuple([NoAnnoList(Str("\"TFunBin\"")),NoAnnoList(Op("TFunBin",[App(CallT(SVar("try"),[CallT(SVar("inline-completions"),[],[NoAnnoList(Op("Type-Plhdr",[]))])],[]),NoAnnoList(Op("Type-Plhdr",[]))),App(CallT(SVar("try"),[CallT(SVar("inline-completions"),[],[NoAnnoList(Op("Type-Plhdr",[]))])],[]),NoAnnoList(Op("Type-Plhdr",[])))]))]))]),Fail),Var("completions")),[]))),SDefT("suggest-completions",[],[VarDec("completions",ConstType(SortNoArgs("ATerm")))],SRule(Rule(NoAnnoList(Op("Gtycon-Plhdr",[])),App(Seq(CallT(SVar("add-completions"),[],[NoAnnoList(Tuple([NoAnnoList(Str("\"TUnit\"")),NoAnnoList(Op("TUnit",[]))]))]),Fail),Var("completions")),[]))),SDefT("suggest-completions",[],[VarDec("completions",ConstType(SortNoArgs("ATerm")))],SRule(Rule(NoAnnoList(Op("Gtycon-Plhdr",[])),App(Seq(CallT(SVar("add-completions"),[],[NoAnnoList(Tuple([NoAnnoList(Str("\"TList\"")),NoAnnoList(Op("TList",[]))]))]),Fail),Var("completions")),[]))),SDefT("suggest-completions",[],[VarDec("completions",ConstType(SortNoArgs("ATerm")))],SRule(Rule(NoAnnoList(Op("Gtycon-Plhdr",[])),App(Seq(CallT(SVar("add-completions"),[],[NoAnnoList(Tuple([NoAnnoList(Str("\"TProduct\"")),NoAnnoList(Op("TProduct",[NoAnnoList(List([App(CallT(SVar("try"),[CallT(SVar("inline-completions"),[],[NoAnnoList(Op("Gtycon-Plhdr",[]))])],[]),NoAnnoList(Op("Comma-Plhdr",[])))]))]))]))]),Fail),Var("completions")),[]))),SDefT("suggest-completions",[],[VarDec("completions",ConstType(SortNoArgs("ATerm")))],SRule(Rule(NoAnnoList(Op("Comma-Plhdr",[])),App(Seq(CallT(SVar("add-completions"),[],[NoAnnoList(Tuple([NoAnnoList(Str("\"Comma\"")),NoAnnoList(Op("Comma",[]))]))]),Fail),Var("completions")),[])))]),Rules([SDefT("is-left-recursive",[],[],SRule(Rule(NoAnnoList(Str("\"Qtycon\"")),App(CallT(SVar("is-left-recursive"),[],[]),NoAnnoList(Str("\"Gtycon\""))),[WhereClause(BA(Not(CallT(SVar("is-lexical-completion-sort"),[],[])),NoAnnoList(Str("\"Qtycon\""))))]))),SDefT("is-right-recursive",[],[],SRule(Rule(NoAnnoList(Str("\"Qtycon\"")),App(CallT(SVar("is-right-recursive"),[],[]),NoAnnoList(Str("\"Gtycon\""))),[WhereClause(BA(Not(CallT(SVar("is-lexical-completion-sort"),[],[])),NoAnnoList(Str("\"Qtycon\""))))]))),SDefT("is-Gtycon-completion-sort",[],[],SRule(Rule(NoAnnoList(Str("\"Qtycon\"")),RootApp(Id),[]))),SDefT("suggest-completions-left-rec",[],[VarDec("completions",ConstType(SortNoArgs("ATerm")))],SRule(Rule(NoAnnoList(Tuple([Var("sort"),Var("orig-term")])),App(Seq(CallT(SVar("add-completions"),[],[NoAnnoList(Tuple([NoAnnoList(Str("\"TAppBin\"")),NoAnnoList(Op("TAppBin",[Var("orig-term"),App(CallT(SVar("try"),[CallT(SVar("inline-completions"),[],[NoAnnoList(Op("Type-Plhdr",[]))])],[]),NoAnnoList(Op("Type-Plhdr",[])))]))]))]),Fail),Var("completions")),[WhereClause(BA(CallT(SVar("is-Type-completion-sort"),[],[]),Var("sort")))]))),SDefT("is-left-recursive",[],[],SRule(Rule(NoAnnoList(Str("\"Type\"")),RootApp(Id),[]))),SDefT("suggest-completions-left-rec",[],[VarDec("completions",ConstType(SortNoArgs("ATerm")))],SRule(Rule(NoAnnoList(Tuple([Var("sort"),Var("orig-term")])),App(Seq(CallT(SVar("add-completions"),[],[NoAnnoList(Tuple([NoAnnoList(Str("\"TFunBin\"")),NoAnnoList(Op("TFunBin",[Var("orig-term"),App(CallT(SVar("try"),[CallT(SVar("inline-completions"),[],[NoAnnoList(Op("Type-Plhdr",[]))])],[]),NoAnnoList(Op("Type-Plhdr",[])))]))]))]),Fail),Var("completions")),[WhereClause(BA(CallT(SVar("is-Type-completion-sort"),[],[]),Var("sort")))]))),SDefT("suggest-completions-right-rec",[],[VarDec("completions",ConstType(SortNoArgs("ATerm")))],SRule(Rule(NoAnnoList(Tuple([Var("sort"),Var("orig-term")])),App(Seq(CallT(SVar("add-completions"),[],[NoAnnoList(Tuple([NoAnnoList(Str("\"TAppBin\"")),NoAnnoList(Op("TAppBin",[App(CallT(SVar("try"),[CallT(SVar("inline-completions"),[],[NoAnnoList(Op("Type-Plhdr",[]))])],[]),NoAnnoList(Op("Type-Plhdr",[]))),Var("orig-term")]))]))]),Fail),Var("completions")),[WhereClause(BA(CallT(SVar("is-Type-completion-sort"),[],[]),Var("sort")))]))),SDefT("is-right-recursive",[],[],SRule(Rule(NoAnnoList(Str("\"Type\"")),RootApp(Id),[]))),SDefT("suggest-completions-right-rec",[],[VarDec("completions",ConstType(SortNoArgs("ATerm")))],SRule(Rule(NoAnnoList(Tuple([Var("sort"),Var("orig-term")])),App(Seq(CallT(SVar("add-completions"),[],[NoAnnoList(Tuple([NoAnnoList(Str("\"TFunBin\"")),NoAnnoList(Op("TFunBin",[App(CallT(SVar("try"),[CallT(SVar("inline-completions"),[],[NoAnnoList(Op("Type-Plhdr",[]))])],[]),NoAnnoList(Op("Type-Plhdr",[]))),Var("orig-term")]))]))]),Fail),Var("completions")),[WhereClause(BA(CallT(SVar("is-Type-completion-sort"),[],[]),Var("sort")))]))),SDefT("is-Type-completion-sort",[],[],SRule(Rule(NoAnnoList(Str("\"Type\"")),RootApp(Id),[]))),SDefT("is-left-recursive",[],[],SRule(Rule(NoAnnoList(Str("\"Gtycon\"")),App(CallT(SVar("is-left-recursive"),[],[]),NoAnnoList(Str("\"AType\""))),[WhereClause(BA(Not(CallT(SVar("is-lexical-completion-sort"),[],[])),NoAnnoList(Str("\"Gtycon\""))))]))),SDefT("is-right-recursive",[],[],SRule(Rule(NoAnnoList(Str("\"Gtycon\"")),App(CallT(SVar("is-right-recursive"),[],[]),NoAnnoList(Str("\"AType\""))),[WhereClause(BA(Not(CallT(SVar("is-lexical-completion-sort"),[],[])),NoAnnoList(Str("\"Gtycon\""))))]))),SDefT("is-AType-completion-sort",[],[],SRule(Rule(NoAnnoList(Str("\"Gtycon\"")),RootApp(Id),[]))),SDefT("is-left-recursive",[],[],SRule(Rule(NoAnnoList(Str("\"Tyvar\"")),App(CallT(SVar("is-left-recursive"),[],[]),NoAnnoList(Str("\"AType\""))),[WhereClause(BA(Not(CallT(SVar("is-lexical-completion-sort"),[],[])),NoAnnoList(Str("\"Tyvar\""))))]))),SDefT("is-right-recursive",[],[],SRule(Rule(NoAnnoList(Str("\"Tyvar\"")),App(CallT(SVar("is-right-recursive"),[],[]),NoAnnoList(Str("\"AType\""))),[WhereClause(BA(Not(CallT(SVar("is-lexical-completion-sort"),[],[])),NoAnnoList(Str("\"Tyvar\""))))]))),SDefT("is-AType-completion-sort",[],[],SRule(Rule(NoAnnoList(Str("\"Tyvar\"")),RootApp(Id),[]))),SDefT("is-left-recursive",[],[],SRule(Rule(NoAnnoList(Str("\"AType\"")),App(CallT(SVar("is-left-recursive"),[],[]),NoAnnoList(Str("\"Type\""))),[WhereClause(BA(Not(CallT(SVar("is-lexical-completion-sort"),[],[])),NoAnnoList(Str("\"AType\""))))]))),SDefT("is-right-recursive",[],[],SRule(Rule(NoAnnoList(Str("\"AType\"")),App(CallT(SVar("is-right-recursive"),[],[]),NoAnnoList(Str("\"Type\""))),[WhereClause(BA(Not(CallT(SVar("is-lexical-completion-sort"),[],[])),NoAnnoList(Str("\"AType\""))))]))),SDefT("is-Type-completion-sort",[],[],SRule(Rule(NoAnnoList(Str("\"AType\"")),RootApp(Id),[])))]),Rules([SDefT("is-SDF-placeholder",[],[],Match(NoAnnoList(Op("OptSig-Plhdr",[])))),SDefT("is-SDF-placeholder",[],[],Match(NoAnnoList(Op("Seq1-Plhdr",[])))),SDefT("is-SDF-placeholder",[],[],Match(NoAnnoList(Op("Type-Plhdr",[])))),SDefT("is-SDF-placeholder",[],[],Match(NoAnnoList(Op("Qtycon-Plhdr",[])))),SDefT("is-SDF-placeholder",[],[],Match(NoAnnoList(Op("Gtycon-Plhdr",[])))),SDefT("is-SDF-placeholder",[],[],Match(NoAnnoList(Op("Types-Plhdr",[])))),SDefT("is-SDF-placeholder",[],[],Match(NoAnnoList(Op("Types2-Plhdr",[])))),SDefT("is-SDF-placeholder",[],[],Match(NoAnnoList(Op("Type-Plhdr",[])))),SDefT("is-SDF-placeholder",[],[],Match(NoAnnoList(Op("Gtycon-Plhdr",[])))),SDefT("is-SDF-placeholder",[],[],Match(NoAnnoList(Op("Tyvar-Plhdr",[])))),SDefT("is-SDF-placeholder",[],[],Match(NoAnnoList(Op("Types2-Plhdr",[])))),SDefT("is-SDF-placeholder",[],[],Match(NoAnnoList(Op("AType-Plhdr",[])))),SDefT("is-SDF-placeholder",[],[],Match(NoAnnoList(Op("Type-Plhdr",[])))),SDefT("is-SDF-placeholder",[],[],Match(NoAnnoList(Op("Gtycon-Plhdr",[])))),SDefT("is-SDF-placeholder",[],[],Match(NoAnnoList(Op("Comma-Plhdr",[]))))])])