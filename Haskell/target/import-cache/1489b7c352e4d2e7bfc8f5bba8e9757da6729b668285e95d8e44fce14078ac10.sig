Module("libspoofax/editor/completion/core",[Imports([(),(),(),()]),Signature([Constructors([OpDecl("INSERTION_TERM",FunType([ConstType(SortNoArgs("NewTerm"))],ConstType(SortNoArgs("AST_CHANGE")))),OpDecl("REPLACE_TERM",FunType([ConstType(SortNoArgs("OldTerm")),ConstType(SortNoArgs("NewTerm"))],ConstType(SortNoArgs("AST_CHANGE"))))])]),Signature([Constructors([OpDecl("CURSOR_ELEMENT",ConstType(SortVar("cursor")))])]),Rules([SDefT("get-parent-non-amb",[],[],[]),SDefT("is-bracket-node",[],[],[])]),Rules([SDefT("add-completions",[],[VarDec("suggestion",ConstType(SortNoArgs("ATerm")))],[]),SDefT("add-list-completions",[],[VarDec("suggestion*",ConstType(SortNoArgs("ATerm")))],[]),SDefT("wrap-term",[],[VarDec("new-cons",ConstType(SortNoArgs("ATerm")))],[]),SDefT("inline-completions",[],[VarDec("sort",ConstType(SortNoArgs("ATerm")))],[]),SDefT("find-position",[],[],[]),SDefT("get-index-origin",[],[VarDec("idx",ConstType(SortNoArgs("ATerm")))],[]),SDefT("get-index-origin",[],[VarDec("idx",ConstType(SortNoArgs("ATerm")))],[]),SDefT("get-index-cursor-position",[],[VarDec("idx",ConstType(SortNoArgs("ATerm")))],[]),SDefT("match-node-origin",[],[VarDec("node",ConstType(SortNoArgs("ATerm")))],[]),SDefT("get-index-cursor-position",[],[VarDec("idx",ConstType(SortNoArgs("ATerm")))],[]),SDefT("my-position-of-term",[VarDec("is-term",ConstType(SortNoArgs("ATerm")))],[VarDec("start-index",ConstType(SortNoArgs("ATerm")))],[]),SDefT("my-position-of-term",[VarDec("is-term",ConstType(SortNoArgs("ATerm")))],[],[]),SDefT("my-position-of-term",[VarDec("is-term",ConstType(SortNoArgs("ATerm")))],[],[]),SDefT("my-position-of-term",[VarDec("is-term",ConstType(SortNoArgs("ATerm")))],[VarDec("start-index",ConstType(SortNoArgs("ATerm")))],[]),SDefT("check-blank-line",[],[],[]),SDefT("calculate-leading-ws",[VarDec("leading-ws",ConstType(SortNoArgs("ATerm")))],[VarDec("term",ConstType(SortNoArgs("ATerm")))],[]),SDefT("calculate-leading-ws",[VarDec("leading-ws",ConstType(SortNoArgs("ATerm")))],[VarDec("term",ConstType(SortNoArgs("ATerm")))],[])])])