Module("libspoofax/stratego/debug",[Imports([Import("libstratego-aterm")]),Rules([SDefT("debug",[],[VarDec("t",ConstType(SortNoArgs("ATerm")))],Where(Seq(CallT(SVar("write-to-string"),[],[]),CallT(SVar("debug"),[Build(Var("t"))],[])))),SDefT("debug0",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"0 \""))])),SDefT("debug1",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"1 \""))])),SDefT("debug2",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"2 \""))])),SDefT("debug3",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"3 \""))])),SDefT("debug4",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"4 \""))])),SDefT("debug5",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"5 \""))])),SDefT("debug6",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"6 \""))])),SDefT("debug7",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"7 \""))])),SDefT("debug8",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"8 \""))])),SDefT("debug9",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"9 \""))])),SDefT("debuga",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"a \""))])),SDefT("debugb",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"b \""))])),SDefT("debugc",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"c \""))])),SDefT("debugd",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"d \""))])),SDefT("debuge",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"e \""))])),SDefT("debugf",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"f \""))])),SDefT("debugg",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"g \""))])),SDefT("debugh",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"h \""))])),SDefT("debugi",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"i \""))])),SDefT("debugj",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"j \""))])),SDefT("debugk",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"k \""))])),SDefT("debugl",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"l \""))])),SDefT("debugm",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"m \""))])),SDefT("debugn",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"n \""))])),SDefT("debugo",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"o \""))])),SDefT("debugp",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"p \""))])),SDefT("debugq",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"q \""))])),SDefT("debugr",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"r \""))])),SDefT("debugs",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"s \""))])),SDefT("debugt",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"t \""))])),SDefT("debugu",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"u \""))])),SDefT("debugv",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"v \""))])),SDefT("debugw",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"w \""))])),SDefT("debugx",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"x \""))])),SDefT("debugy",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"y \""))])),SDefT("debugz",[],[],CallT(SVar("debug"),[],[NoAnnoList(Str("\"z \""))]))]),Rules([SDefT("ppdebug",[],[VarDec("t",ConstType(SortNoArgs("ATerm")))],Where(Seq(CallT(SVar("pp-aterm"),[],[]),CallT(SVar("debug"),[Build(Var("t"))],[])))),SDefT("ppdebug0",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"0 \""))])),SDefT("ppdebug1",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"1 \""))])),SDefT("ppdebug2",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"2 \""))])),SDefT("ppdebug3",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"3 \""))])),SDefT("ppdebug4",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"4 \""))])),SDefT("ppdebug5",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"5 \""))])),SDefT("ppdebug6",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"6 \""))])),SDefT("ppdebug7",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"7 \""))])),SDefT("ppdebug8",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"8 \""))])),SDefT("ppdebug9",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"9 \""))])),SDefT("ppdebuga",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"a \""))])),SDefT("ppdebugb",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"b \""))])),SDefT("ppdebugc",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"c \""))])),SDefT("ppdebugd",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"d \""))])),SDefT("ppdebuge",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"e \""))])),SDefT("ppdebugf",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"f \""))])),SDefT("ppdebugg",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"g \""))])),SDefT("ppdebugh",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"h \""))])),SDefT("ppdebugi",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"i \""))])),SDefT("ppdebugj",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"j \""))])),SDefT("ppdebugk",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"k \""))])),SDefT("ppdebugl",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"l \""))])),SDefT("ppdebugm",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"m \""))])),SDefT("ppdebugn",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"n \""))])),SDefT("ppdebugo",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"o \""))])),SDefT("ppdebugp",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"p \""))])),SDefT("ppdebugq",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"q \""))])),SDefT("ppdebugr",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"r \""))])),SDefT("ppdebugs",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"s \""))])),SDefT("ppdebugt",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"t \""))])),SDefT("ppdebugu",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"u \""))])),SDefT("ppdebugv",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"v \""))])),SDefT("ppdebugw",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"w \""))])),SDefT("ppdebugx",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"x \""))])),SDefT("ppdebugy",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"y \""))])),SDefT("ppdebugz",[],[],CallT(SVar("ppdebug"),[],[NoAnnoList(Str("\"z \""))]))]),Rules([SDefT("ppdebugna",[],[VarDec("t",ConstType(SortNoArgs("ATerm")))],Where(Seq(CallT(SVar("strip-annos"),[],[]),Seq(CallT(SVar("pp-aterm"),[],[]),CallT(SVar("debug"),[Build(Var("t"))],[]))))),SDefT("ppdebugna0",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"0 \""))])),SDefT("ppdebugna1",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"1 \""))])),SDefT("ppdebugna2",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"2 \""))])),SDefT("ppdebugna3",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"3 \""))])),SDefT("ppdebugna4",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"4 \""))])),SDefT("ppdebugna5",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"5 \""))])),SDefT("ppdebugna6",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"6 \""))])),SDefT("ppdebugna7",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"7 \""))])),SDefT("ppdebugna8",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"8 \""))])),SDefT("ppdebugna9",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"9 \""))])),SDefT("ppdebugnaa",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"a \""))])),SDefT("ppdebugnab",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"b \""))])),SDefT("ppdebugnac",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"c \""))])),SDefT("ppdebugnad",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"d \""))])),SDefT("ppdebugnae",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"e \""))])),SDefT("ppdebugnaf",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"f \""))])),SDefT("ppdebugnag",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"g \""))])),SDefT("ppdebugnah",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"h \""))])),SDefT("ppdebugnai",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"i \""))])),SDefT("ppdebugnaj",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"j \""))])),SDefT("ppdebugnak",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"k \""))])),SDefT("ppdebugnal",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"l \""))])),SDefT("ppdebugnam",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"m \""))])),SDefT("ppdebugnan",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"n \""))])),SDefT("ppdebugnao",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"o \""))])),SDefT("ppdebugnap",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"p \""))])),SDefT("ppdebugnaq",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"q \""))])),SDefT("ppdebugnar",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"r \""))])),SDefT("ppdebugnas",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"s \""))])),SDefT("ppdebugnat",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"t \""))])),SDefT("ppdebugnau",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"u \""))])),SDefT("ppdebugnav",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"v \""))])),SDefT("ppdebugnaw",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"w \""))])),SDefT("ppdebugnax",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"x \""))])),SDefT("ppdebugnay",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"y \""))])),SDefT("ppdebugnaz",[],[],CallT(SVar("ppdebugna"),[],[NoAnnoList(Str("\"z \""))]))]),Rules([SDefT("cputime",[],[],PrimNoArgs("\"SSL_cputime\"")),SDefT("cputime-to-seconds",[],[],SRule(Rule(Var("cputime"),App(CallT(SVar("div"),[],[]),NoAnnoList(Tuple([Var("cputime"),NoAnnoList(Int("1000000000"))]))),[]))),SDefT("measure-time",[VarDec("s",ConstType(SortNoArgs("ATerm"))),VarDec("match",ConstType(SortNoArgs("ATerm")))],[],Seq(Where(Assign(Var("before"),RootApp(CallT(SVar("cputime"),[],[])))),Seq(CallT(SVar("s"),[],[]),Where(Seq(Assign(Var("after"),RootApp(CallT(SVar("cputime"),[],[]))),Seq(Build(NoAnnoList(Tuple([Var("after"),Var("before")]))),Seq(CallT(SVar("subt"),[],[]),CallT(SVar("match"),[],[]))))))))])])