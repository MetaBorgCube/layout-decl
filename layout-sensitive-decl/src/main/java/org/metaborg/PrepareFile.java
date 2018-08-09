package org.metaborg;

import java.io.File;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import org.metaborg.CommandExecution.ExecutionError;

public class PrepareFile {

    public static File prepareFile(File f, String pkg) throws IOException {
        try {
            File fnorm = new File(f.getAbsolutePath() + ".norm.hs");
            DeleteUnicode.deleteUnicode(f.getAbsolutePath(), fnorm.getAbsolutePath());
            File fpp = preprocess(fnorm, pkg);
            Utilities.deleteFile(fnorm);
            return fpp;
            // return makeLayout(fpp, pkg, false);
        } catch(OutOfMemoryError e) {
            e = null;
            System.gc();
            return null;
        }
    }
    
    
    public static File prepareFileExplicit(File f, String pkg) throws IOException {
        try {
            File fnorm = new File(f.getAbsolutePath() + ".norm.hs");
            DeleteUnicode.deleteUnicode(f.getAbsolutePath(), fnorm.getAbsolutePath());
            File fpp = preprocess(fnorm, pkg);
            Utilities.deleteFile(fnorm);
            return makeLayout(fpp, pkg, true);
        } catch(OutOfMemoryError e) {
            e = null;
            System.gc();
            return null;
        }
    }
    

    public static File preprocess(File f, String pkg) {
        File res = new File(Utilities.dropExtension(f.getAbsolutePath()) + ".pp.hs");

        CommandExecution.SILENT_EXECUTION = true;
        CommandExecution.SUB_SILENT_EXECUTION = true;

        String[] cmds =
            new String[] { "ghc", "-E", "-cpp", "-optP-P", "-o", res.getAbsolutePath(), f.getAbsolutePath() };

        try {
            CommandExecution.execute(System.out, System.out, "[" + pkg + ", pp]", cmds);
        } catch(ExecutionError e) {
            if(e.getExitValue() == -1)
                throw e;

            return null;
        }
        return res;
    }
    
    private static File makeLayout(File f, String pkg, boolean explicit) throws IOException {
        if(f == null)
            return null;

        File res = new File(Utilities.dropExtension(f.getAbsolutePath()) + (explicit ? ".expl.hs" : ".impl.hs"));

        List<String> cmds = new LinkedList<String>();
        cmds.add(TestConfiguration.PP_HASKELL_COMMAND);
        cmds.add("-i");
        cmds.add(f.getAbsolutePath());
        cmds.add("-o");
        cmds.add(res.getAbsolutePath());
        cmds.add("--ignore-language-pragmas");
        cmds.add("--line-length=500");
        cmds.add("--ribbons-per-line=10");
        cmds.add(explicit ? "--explicit-layout" : "--implicit-layout");

        for(String ext : TestConfiguration.HASKELL_EXTENSIONS)
            cmds.add("-X" + ext);

        cmds.toArray(new String[cmds.size()]);

        CommandExecution.SILENT_EXECUTION = true;
        CommandExecution.SUB_SILENT_EXECUTION = true;

        String[][] messages = new String[][] { new String[] {}, new String[] {} };
        long time = -1;

        try {
            Object[] result = CommandExecution.execute(System.out, System.out, "[" + pkg + ", old]",
                cmds.toArray(new String[cmds.size()]));
            time = (Long) result[0];
            messages[0] = (String[]) result[1];
            messages[1] = (String[]) result[2];
        } catch(ExecutionError e) {
            if(e.getMessages() == null || e.getMessages().length == 0)
                throw e;
            messages = e.getMessages();
            return null;
        } finally {

        }

        return res.exists() ? res : null;
    }
}
