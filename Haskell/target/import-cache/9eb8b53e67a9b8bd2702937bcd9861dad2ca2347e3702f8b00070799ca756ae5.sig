Module("signatures/Haskell-Patterns-sig",[Imports([Import("signatures/Haskell-Identifier-Sorts-sig"),Import("signatures/Haskell-Literals-sig")]),Signature([Constructors([OpDeclInj(FunType([ConstType(SortNoArgs("LPat"))],ConstType(SortNoArgs("Pat")))),OpDecl("BinOpApp",FunType([ConstType(SortNoArgs("Pat")),ConstType(SortNoArgs("Qconop")),ConstType(SortNoArgs("LPat"))],ConstType(SortNoArgs("Pat")))),OpDeclInj(FunType([ConstType(SortNoArgs("APat"))],ConstType(SortNoArgs("LPat")))),OpDecl("Negation",FunType([ConstType(SortNoArgs("Literal"))],ConstType(SortNoArgs("LPat")))),OpDecl("ConstrApp",FunType([ConstType(SortNoArgs("Gcon")),ConstType(Sort("List",[SortNoArgs("APat")]))],ConstType(SortNoArgs("LPat")))),OpDeclInj(FunType([ConstType(SortNoArgs("Var"))],ConstType(SortNoArgs("APat")))),OpDecl("Named",FunType([ConstType(SortNoArgs("Var")),ConstType(SortNoArgs("APat"))],ConstType(SortNoArgs("APat")))),OpDecl("Constr",FunType([ConstType(SortNoArgs("Gcon"))],ConstType(SortNoArgs("APat")))),OpDecl("Labeled",FunType([ConstType(SortNoArgs("Qcon")),ConstType(SortNoArgs("LabeledPat"))],ConstType(SortNoArgs("APat")))),OpDecl("LabeledPats",FunType([ConstType(Sort("List",[SortNoArgs("FPat")]))],ConstType(SortNoArgs("LabeledPat")))),OpDeclInj(FunType([ConstType(SortNoArgs("Literal"))],ConstType(SortNoArgs("APat")))),OpDecl("Wildcard",ConstType(SortNoArgs("APat"))),OpDecl("Pat",FunType([ConstType(SortNoArgs("Pat"))],ConstType(SortNoArgs("APat")))),OpDecl("Tuple",FunType([ConstType(SortNoArgs("Pat")),ConstType(Sort("List",[SortNoArgs("Pat")]))],ConstType(SortNoArgs("APat")))),OpDecl("List",FunType([ConstType(Sort("List",[SortNoArgs("Pat")]))],ConstType(SortNoArgs("APat")))),OpDecl("Irrefutable",FunType([ConstType(SortNoArgs("APat"))],ConstType(SortNoArgs("APat")))),OpDecl("PatBind",FunType([ConstType(SortNoArgs("Qvar")),ConstType(SortNoArgs("Pat"))],ConstType(SortNoArgs("FPat")))),OpDecl("Qconop-Plhdr",ConstType(SortNoArgs("Qconop"))),OpDecl("LPat-Plhdr",ConstType(SortNoArgs("LPat"))),OpDecl("Var-Plhdr",ConstType(SortNoArgs("Var"))),OpDecl("Gcon-Plhdr",ConstType(SortNoArgs("Gcon"))),OpDecl("Qcon-Plhdr",ConstType(SortNoArgs("Qcon"))),OpDecl("LabeledPat-Plhdr",ConstType(SortNoArgs("LabeledPat"))),OpDecl("Literal-Plhdr",ConstType(SortNoArgs("Literal"))),OpDecl("APat-Plhdr",ConstType(SortNoArgs("APat"))),OpDecl("FPat-Plhdr",ConstType(SortNoArgs("FPat"))),OpDecl("Qvar-Plhdr",ConstType(SortNoArgs("Qvar"))),OpDecl("Pat-Plhdr",ConstType(SortNoArgs("Pat"))),OpDecl("Qconop-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("Qconop")))),OpDecl("LPat-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("LPat")))),OpDecl("Var-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("Var")))),OpDecl("Gcon-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("Gcon")))),OpDecl("Qcon-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("Qcon")))),OpDecl("LabeledPat-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("LabeledPat")))),OpDecl("Literal-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("Literal")))),OpDecl("APat-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("APat")))),OpDecl("FPat-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("FPat")))),OpDecl("Qvar-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("Qvar")))),OpDecl("Pat-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("Pat")))),OpDecl("FPat-Opt-Plhdr",ConstType(SortNoArgs("FPat")))])])])