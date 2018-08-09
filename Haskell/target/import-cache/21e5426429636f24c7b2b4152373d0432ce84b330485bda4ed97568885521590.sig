Module("signatures/Haskell-List-Comprehensions-sig",[Imports([Import("signatures/Haskell-Qualifiers-sig")]),Signature([Constructors([OpDecl("List",FunType([ConstType(SortNoArgs("List"))],ConstType(SortNoArgs("Exp")))),OpDeclInj(FunType([ConstType(SortNoArgs("Lexps"))],ConstType(SortNoArgs("List")))),OpDecl("Dots",FunType([ConstType(SortNoArgs("Exp"))],ConstType(SortNoArgs("List")))),OpDecl("Colon",FunType([ConstType(SortNoArgs("Exp")),ConstType(SortNoArgs("Exp"))],ConstType(SortNoArgs("List")))),OpDecl("Range",FunType([ConstType(SortNoArgs("Exp")),ConstType(SortNoArgs("Exp"))],ConstType(SortNoArgs("List")))),OpDecl("CommaRange",FunType([ConstType(SortNoArgs("Exp")),ConstType(SortNoArgs("Exp")),ConstType(SortNoArgs("Exp"))],ConstType(SortNoArgs("List")))),OpDecl("SuchThat",FunType([ConstType(SortNoArgs("Exp")),ConstType(SortNoArgs("Quals"))],ConstType(SortNoArgs("List")))),OpDecl("Exps",FunType([ConstType(Sort("List",[SortNoArgs("Exp")]))],ConstType(SortNoArgs("Lexps")))),OpDecl("List-Plhdr",ConstType(SortNoArgs("List"))),OpDecl("Quals-Plhdr",ConstType(SortNoArgs("Quals"))),OpDecl("Lexps-Plhdr",ConstType(SortNoArgs("Lexps"))),OpDecl("Exp-Plhdr",ConstType(SortNoArgs("Exp"))),OpDecl("List-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("List")))),OpDecl("Quals-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("Quals")))),OpDecl("Lexps-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("Lexps")))),OpDecl("Exp-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("Exp"))))])])])