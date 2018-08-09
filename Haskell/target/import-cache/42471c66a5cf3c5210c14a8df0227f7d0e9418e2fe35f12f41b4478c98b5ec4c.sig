Module("signatures/Haskell-Value-Definitions-sig",[Imports([Import("signatures/Haskell-Patterns-sig"),Import("signatures/Haskell-Expressions-sig"),Import("signatures/Haskell-Identifier-Sorts-sig"),Import("signatures/Haskell-Modules-sig")]),Signature([Constructors([OpDeclInj(FunType([ConstType(SortNoArgs("Valdef"))],ConstType(SortNoArgs("Decl")))),OpDecl("Valdef",FunType([ConstType(SortNoArgs("FunLHS")),ConstType(SortNoArgs("Exp")),ConstType(SortNoArgs("MaybeWhere"))],ConstType(SortNoArgs("Valdef")))),OpDecl("GdValdef",FunType([ConstType(SortNoArgs("FunLHS")),ConstType(Sort("List",[SortNoArgs("Gdrh")])),ConstType(SortNoArgs("MaybeWhere"))],ConstType(SortNoArgs("Valdef")))),OpDecl("Guarded",FunType([ConstType(SortNoArgs("Exp")),ConstType(SortNoArgs("Exp"))],ConstType(SortNoArgs("Gdrh")))),OpDeclInj(FunType([ConstType(SortNoArgs("Pat"))],ConstType(SortNoArgs("FunLHS")))),OpDecl("VarFunLHS",FunType([ConstType(SortNoArgs("Var")),ConstType(Sort("List",[SortNoArgs("APat")]))],ConstType(SortNoArgs("FunLHS")))),OpDecl("OpFunLHS",FunType([ConstType(SortNoArgs("Pat")),ConstType(SortNoArgs("Varop")),ConstType(SortNoArgs("Pat"))],ConstType(SortNoArgs("FunLHS")))),OpDecl("NestedFunLHS",FunType([ConstType(SortNoArgs("FunLHS")),ConstType(Sort("List",[SortNoArgs("APat")]))],ConstType(SortNoArgs("FunLHS")))),OpDecl("Decl-Plhdr",ConstType(SortNoArgs("Decl"))),OpDecl("Valdef-Plhdr",ConstType(SortNoArgs("Valdef"))),OpDecl("MaybeWhere-Plhdr",ConstType(SortNoArgs("MaybeWhere"))),OpDecl("Gdrh-Plhdr",ConstType(SortNoArgs("Gdrh"))),OpDecl("Exp-Plhdr",ConstType(SortNoArgs("Exp"))),OpDecl("Var-Plhdr",ConstType(SortNoArgs("Var"))),OpDecl("Varop-Plhdr",ConstType(SortNoArgs("Varop"))),OpDecl("Pat-Plhdr",ConstType(SortNoArgs("Pat"))),OpDecl("FunLHS-Plhdr",ConstType(SortNoArgs("FunLHS"))),OpDecl("APat-Plhdr",ConstType(SortNoArgs("APat"))),OpDecl("Decl-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("Decl")))),OpDecl("Valdef-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("Valdef")))),OpDecl("MaybeWhere-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("MaybeWhere")))),OpDecl("Gdrh-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("Gdrh")))),OpDecl("Exp-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("Exp")))),OpDecl("Var-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("Var")))),OpDecl("Varop-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("Varop")))),OpDecl("Pat-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("Pat")))),OpDecl("FunLHS-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("FunLHS")))),OpDecl("APat-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("APat")))),OpDecl("Where",FunType([ConstType(SortNoArgs("DeclList"))],ConstType(SortNoArgs("Where")))),OpDeclInj(ConstType(SortNoArgs("MaybeWhere"))),OpDeclInj(FunType([ConstType(SortNoArgs("Where"))],ConstType(SortNoArgs("MaybeWhere")))),OpDeclInj(FunType([ConstType(SortNoArgs("DeclList"))],ConstType(SortNoArgs("Declbinds")))),OpDecl("MaybeWhere-Plhdr",ConstType(SortNoArgs("MaybeWhere"))),OpDecl("Where-Plhdr",ConstType(SortNoArgs("Where"))),OpDecl("Declbinds-Plhdr",ConstType(SortNoArgs("Declbinds"))),OpDecl("DeclList-Plhdr",ConstType(SortNoArgs("DeclList"))),OpDecl("MaybeWhere-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("MaybeWhere")))),OpDecl("Where-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("Where")))),OpDecl("Declbinds-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("Declbinds")))),OpDecl("DeclList-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("DeclList")))),OpDecl("DeclList",FunType([ConstType(SortNoArgs("NoOffsideDeclBlock"))],ConstType(SortNoArgs("DeclList")))),OpDecl("DeclListOffside",FunType([ConstType(SortNoArgs("OffsideDeclListOrEmpty"))],ConstType(SortNoArgs("DeclList")))),OpDeclInj(FunType([ConstType(SortNoArgs("OffsideDeclList"))],ConstType(SortNoArgs("OffsideDeclListOrEmpty")))),OpDeclInj(FunType([ConstType(SortNoArgs("Empty"))],ConstType(SortNoArgs("OffsideDeclListOrEmpty")))),OpDecl("NoOffsideDeclBlock",FunType([ConstType(SortNoArgs("NoOffsideDeclListSemOrEmpty"))],ConstType(SortNoArgs("NoOffsideDeclBlock")))),OpDeclInj(FunType([ConstType(SortNoArgs("NoOffsideDeclListSem"))],ConstType(SortNoArgs("NoOffsideDeclListSemOrEmpty")))),OpDeclInj(FunType([ConstType(SortNoArgs("Empty"))],ConstType(SortNoArgs("NoOffsideDeclListSemOrEmpty")))),OpDeclInj(FunType([ConstType(SortNoArgs("Decl"))],ConstType(SortNoArgs("NoOffsideDecl")))),OpDecl("SemiAfter",FunType([ConstType(SortNoArgs("NoOffsideDecl"))],ConstType(SortNoArgs("NoOffsideDecl")))),OpDecl("DeclList-Plhdr",ConstType(SortNoArgs("DeclList"))),OpDecl("OffsideDeclList-Plhdr",ConstType(SortNoArgs("OffsideDeclList"))),OpDecl("OffsideDeclListOrEmpty-Plhdr",ConstType(SortNoArgs("OffsideDeclListOrEmpty"))),OpDecl("NoOffsideDeclBlock-Plhdr",ConstType(SortNoArgs("NoOffsideDeclBlock"))),OpDecl("NoOffsideDeclListSem-Plhdr",ConstType(SortNoArgs("NoOffsideDeclListSem"))),OpDecl("NoOffsideDeclListSemOrEmpty-Plhdr",ConstType(SortNoArgs("NoOffsideDeclListSemOrEmpty"))),OpDecl("Empty-Plhdr",ConstType(SortNoArgs("Empty"))),OpDecl("Decl-Plhdr",ConstType(SortNoArgs("Decl"))),OpDecl("NoOffsideDecl-Plhdr",ConstType(SortNoArgs("NoOffsideDecl"))),OpDecl("DeclList-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("DeclList")))),OpDecl("OffsideDeclList-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("OffsideDeclList")))),OpDecl("OffsideDeclListOrEmpty-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("OffsideDeclListOrEmpty")))),OpDecl("NoOffsideDeclBlock-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("NoOffsideDeclBlock")))),OpDecl("NoOffsideDeclListSem-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("NoOffsideDeclListSem")))),OpDecl("NoOffsideDeclListSemOrEmpty-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("NoOffsideDeclListSemOrEmpty")))),OpDecl("Empty-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("Empty")))),OpDecl("Decl-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("Decl")))),OpDecl("NoOffsideDecl-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("NoOffsideDecl")))),OpDeclInj(FunType([ConstType(Sort("List",[SortNoArgs("NoOffsideDecl")]))],ConstType(SortNoArgs("NoOffsideDeclList")))),OpDeclInj(FunType([ConstType(SortNoArgs("NoOffsideDeclList"))],ConstType(SortNoArgs("NoOffsideDeclListSem")))),OpDecl("SemiBefore",FunType([ConstType(SortNoArgs("NoOffsideDeclListSem"))],ConstType(SortNoArgs("NoOffsideDeclListSem")))),OpDeclInj(FunType([ConstType(SortNoArgs("Decl"))],ConstType(SortNoArgs("OffsideDecl")))),OpDecl("SemiAfter",FunType([ConstType(SortNoArgs("OffsideDecl"))],ConstType(SortNoArgs("OffsideDecl")))),OpDecl("SemiBefore",FunType([ConstType(SortNoArgs("OffsideDecl"))],ConstType(SortNoArgs("OffsideDecl")))),OpDecl("DeclSeq",FunType([ConstType(SortNoArgs("OffsideDecl")),ConstType(SortNoArgs("Decl"))],ConstType(SortNoArgs("OffsideDecl")))),OpDecl("NoOffsideDecl-Plhdr",ConstType(SortNoArgs("NoOffsideDecl"))),OpDecl("NoOffsideDeclList-Plhdr",ConstType(SortNoArgs("NoOffsideDeclList"))),OpDecl("NoOffsideDeclListSem-Plhdr",ConstType(SortNoArgs("NoOffsideDeclListSem"))),OpDecl("OffsideDecl-Plhdr",ConstType(SortNoArgs("OffsideDecl"))),OpDecl("Decl-Plhdr",ConstType(SortNoArgs("Decl"))),OpDecl("NoOffsideDecl-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("NoOffsideDecl")))),OpDecl("NoOffsideDeclList-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("NoOffsideDeclList")))),OpDecl("NoOffsideDeclListSem-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("NoOffsideDeclListSem")))),OpDecl("OffsideDecl-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("OffsideDecl")))),OpDecl("Decl-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("Decl")))),OpDeclInj(FunType([ConstType(Sort("List",[SortNoArgs("OffsideDecl")]))],ConstType(SortNoArgs("OffsideDeclList")))),OpDecl("OffsideDeclList-Plhdr",ConstType(SortNoArgs("OffsideDeclList"))),OpDecl("OffsideDecl-Plhdr",ConstType(SortNoArgs("OffsideDecl"))),OpDecl("OffsideDeclList-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("OffsideDeclList")))),OpDecl("OffsideDecl-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("OffsideDecl"))))])])])