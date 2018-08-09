Module("signatures/GHC-Magic-Hash-sig",[Imports([Import("signatures/Haskell-Identifiers-sig"),Import("signatures/Haskell-Numbers-sig"),Import("signatures/Haskell-Strings-sig")]),Signature([Constructors([OpDeclInj(FunType([ConstType(SortNoArgs("String"))],ConstType(SortNoArgs("VARID")))),OpDeclInj(FunType([ConstType(SortNoArgs("String"))],ConstType(SortNoArgs("CONID")))),OpDeclInj(FunType([ConstType(SortNoArgs("String"))],ConstType(SortNoArgs("INTEGER-HASH")))),OpDeclInj(FunType([ConstType(SortNoArgs("String"))],ConstType(SortNoArgs("FLOAT-HASH")))),OpDeclInj(FunType([ConstType(SortNoArgs("String"))],ConstType(SortNoArgs("RATIONAL-HASH")))),OpDeclInj(FunType([ConstType(SortNoArgs("String"))],ConstType(SortNoArgs("Char-HASH")))),OpDeclInj(FunType([ConstType(SortNoArgs("String"))],ConstType(SortNoArgs("String-HASH")))),OpDeclInj(FunType([ConstType(SortNoArgs("String"))],ConstType(SortNoArgs("Integer-HASH")))),OpDeclInj(FunType([ConstType(SortNoArgs("String"))],ConstType(SortNoArgs("Float-HASH")))),OpDecl("CharHash",FunType([ConstType(SortNoArgs("Char-HASH"))],ConstType(SortNoArgs("Literal")))),OpDecl("StringHash",FunType([ConstType(SortNoArgs("String-HASH"))],ConstType(SortNoArgs("Literal")))),OpDecl("IntegerHash",FunType([ConstType(SortNoArgs("Integer-HASH"))],ConstType(SortNoArgs("Literal")))),OpDecl("FloatHash",FunType([ConstType(SortNoArgs("Float-HASH"))],ConstType(SortNoArgs("Literal")))),OpDecl("Char-HASH-Plhdr",ConstType(SortNoArgs("Char-HASH"))),OpDecl("String-HASH-Plhdr",ConstType(SortNoArgs("String-HASH"))),OpDecl("Integer-HASH-Plhdr",ConstType(SortNoArgs("Integer-HASH"))),OpDecl("Literal-Plhdr",ConstType(SortNoArgs("Literal"))),OpDecl("Float-HASH-Plhdr",ConstType(SortNoArgs("Float-HASH"))),OpDecl("Char-HASH-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("Char-HASH")))),OpDecl("String-HASH-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("String-HASH")))),OpDecl("Integer-HASH-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("Integer-HASH")))),OpDecl("Literal-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("Literal")))),OpDecl("Float-HASH-Plhdr",FunType([ConstType(SortNoArgs("COMPLETION-INSERTION"))],ConstType(SortNoArgs("Float-HASH"))))])])])