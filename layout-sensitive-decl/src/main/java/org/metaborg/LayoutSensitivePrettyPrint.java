package org.metaborg;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.apache.commons.io.FileUtils;
import org.apache.commons.vfs2.FileObject;
import org.apache.commons.vfs2.FileSystemManager;
import org.apache.commons.vfs2.VFS;
import org.apache.log4j.Logger;
import org.metaborg.characterclasses.CharacterClassFactory;
import org.metaborg.core.MetaborgException;
import org.metaborg.parsetable.IParseTable;
import org.metaborg.spoofax.core.Spoofax;
import org.metaborg.sunshine.Runner;
import org.metaborg.sunshine.SunshineModule;
import org.spoofax.interpreter.terms.IStrategoTerm;
import org.spoofax.jsglr2.JSGLR2;
import org.spoofax.jsglr2.actions.ActionsFactory;
import org.spoofax.jsglr2.parsetable.ParseTableReader;
import org.spoofax.jsglr2.states.StateFactory;

import com.google.common.base.Charsets;
import com.google.common.collect.Lists;
import com.google.inject.Injector;

public class LayoutSensitivePrettyPrint {

    private static Injector injector;
    private static boolean PRETTYPRINT = true;
    private static boolean SKIPVERIFIED = true;
    private static boolean VERIFY = true;
    private static boolean VERIFYASTS = true;
    private static boolean DELETEINVALIDFILES = true;
    private static boolean SHORTRUN = false;

    public static void main(String[] args) throws Exception {
        Logger.getRootLogger().setLevel(org.apache.log4j.Level.OFF);
        File results = new File("Results/pp");

        if(!results.exists()) {
            results.mkdirs();
        }

        List<String> programs = Lists.newArrayList();

        if(args.length > 0) {
            SHORTRUN = Boolean.parseBoolean(args[0]);
        }

        if(SHORTRUN) {
            System.out.println("\n-- Running short version of the experiment --\n\n ");
        }

        readPrograms(programs);

        if(PRETTYPRINT) {
            prettyPrint(programs);
        }

        if(VERIFY) {
            checkPrettyPrinted(programs);
        }

        deletePrettyPrinted(programs);
    }

    private static void readPrograms(List<String> programs) throws IOException, FileNotFoundException {
        final Path filesThatDoNotParsePath = Paths.get("resources/files/files-do-not-parse.csv");
        final Set<String> filesThatDoNotParse =
            Files.readAllLines(filesThatDoNotParsePath).stream().collect(Collectors.toSet());

        final Path filesThatDoNotPPPath = Paths.get("resources/files/files-do-not-parse-no-module.csv");
        final Set<String> filesThatDoNotPP =
            Files.readAllLines(filesThatDoNotPPPath).stream().collect(Collectors.toSet());

        File csvFile = new File("resources/files/files.csv");
        BufferedReader br = null;
        String line = "";


        File failedToLoad = new File("Results/pp/failedToLoad.txt");
        final BufferedWriter outputFailedToLoad = new BufferedWriter(new FileWriter(failedToLoad));

        br = new BufferedReader(new FileReader(csvFile));
        while((line = br.readLine()) != null) {
            File currentFile = new File("data/" + line);
            String pkg = line.substring(0, line.indexOf("/"));

            if(currentFile.exists() && !filesThatDoNotParse.contains(line) && !filesThatDoNotPP.contains(line)) {
                File preprocessedFile = new File("data/" + line + ".norm.pp.hs");
                if(preprocessedFile.exists()) {
//                    System.out.println("Loaded preprocessed file " + line);
                    programs.add(line);
                } else {
                    File preparedFile = PrepareFile.prepareFile(currentFile, pkg);
                    if(preparedFile != null) {
//                        System.out.println("Loaded " + line);
                        programs.add(line);
                    } else {
                        System.out.println("Failed to load " + line);
                        outputFailedToLoad.write("failed to load: " + line + "\n");
                    }
                }
            }
        }
        br.close();
        outputFailedToLoad.close();
        
        System.out.println("Loaded " + programs.size() + " programs.");

        if(SHORTRUN) {
            List<Integer> indexes = Lists.newArrayList();
            for(int i = 0; i < programs.size(); i++) {
                indexes.add(i);
            }
            Collections.shuffle(indexes);
            List<String> randomPrograms = Lists.newArrayList();

            for(int i = 0; i < 1000; i++) {
                randomPrograms.add(programs.get(indexes.get(i)));
            }

            programs.clear();
            programs.addAll(randomPrograms);
            System.out.println("\nRunning short version on " + randomPrograms.size() + " programs.\n");
        }
    }

    private static void prettyPrint(List<String> programs) throws MetaborgException {
        String[] args;
        for(String program : programs) {
            if(SKIPVERIFIED) {
                File f = new File("data/" + program + ".norm.pp.sdf3pp.hs");
                if(f.exists()) {
                    System.out.println("Already pretty-printed " + program);
                    continue;
                }
            }

            try(final Spoofax spoofax = new Spoofax(new SunshineModule())) {
                injector = spoofax.injector;
                System.out.println("Pretty-printing " + program);

                args = new String[] { "transform", "-l", "../Haskell/", "-p", "../Haskell/", "-n", "Format", "-i",
                    "../layout-sensitive-decl/data/" + program + ".norm.pp.hs" };

                run(args, false);

            } catch(Exception e) {
                System.out.println("Did not pretty-print.");
            } catch(StackOverflowError e) {
                System.out.println("Did not pretty-print. StackOverflowError");
            } catch(OutOfMemoryError e) {
                System.out.println("Did not pretty-print. OutOfMemoryError");
            }
        }
    }

    private static void checkPrettyPrinted(List<String> programs) throws Exception {
        File failedToPrint = new File("Results/pp/failedToPrint.txt");
        final BufferedWriter outputFailedToPrint = new BufferedWriter(new FileWriter(failedToPrint));

        File prettyPrintedCorrectly = new File("Results/pp/prettyPrintedCorrectly.txt");
        final BufferedWriter outputPrettyPrintedCorrectly = new BufferedWriter(new FileWriter(prettyPrintedCorrectly));


        File failedToParsePrettyPrinted = new File("Results/pp/failedToParsePrettyPrinted.txt");
        final BufferedWriter outputfailedToParsePrettyPrinted =
            new BufferedWriter(new FileWriter(failedToParsePrettyPrinted));

        File astsAreDifferent = new File("Results/pp/differentASTs.txt");
        final BufferedWriter outputAstsAreDifferent = new BufferedWriter(new FileWriter(astsAreDifferent));

        for(String program : programs) {
            File f = new File("data/" + program + ".norm.pp.sdf3pp.hs");
            if(!f.exists()) {
                outputFailedToPrint.write("Failed to pretty-print: " + program + "\n");
                System.out.println("Failed to pretty-print: " + program);
            } else if(VERIFYASTS) {
                // parse both the original and pretty-printed programs and check that the AST is the same
                File sdf3TableFile = new File("../Haskell/target/metaborg/sdf.tbl");
                if(!sdf3TableFile.exists()) {
                    System.out.println();
                }
                IStrategoTerm sdf3AtermPt = null;

                FileSystemManager fsManager = VFS.getManager();
                FileObject persistedTable = fsManager.resolveFile(sdf3TableFile.getParentFile(), "table.bin"); // resolveFile("resources/parseTables/sdf3/",
                                                                                                               // "table.bin");

                IParseTable parseTable = new ParseTableReader(new CharacterClassFactory(true, true),
                    new ActionsFactory(true), new StateFactory()).read(sdf3AtermPt, persistedTable);
                JSGLR2<?, IStrategoTerm> parser = JSGLR2.layoutSensitive(parseTable);

                String input = FileUtils.readFileToString(f, Charsets.UTF_8);
                IStrategoTerm astParser1 = parser.parse(input, program + ".norm.pp.sdf3pp.hs", "Module");

                File original = new File("data/" + program + ".norm.pp.hs");
                String inputOriginal = FileUtils.readFileToString(original, Charsets.UTF_8);

                IStrategoTerm astOriginal = parser.parse(inputOriginal, program, "Module");

                if(astParser1 == null) {
                    outputfailedToParsePrettyPrinted.write(program + "\n");
                    System.out.println("Failed to parse pretty-printed program: " + program);
                    if(DELETEINVALIDFILES && f.delete()) {
                        System.out.println("Deleted pretty-printed program: " + program);
                    }
                    continue;
                }

                if(!astParser1.equals(astOriginal)) {
                    outputAstsAreDifferent.write(program + "\n");
                    System.out.println("ASTs of original and pretty-printed programs (" + program + ") are different.");
                    if(DELETEINVALIDFILES && f.delete()) {
                        System.out.println("Deleted pretty-printed program: " + program);
                    }
                } else {
                    outputPrettyPrintedCorrectly.write(program + "\n");
                    System.out.println("LS pretty-printed for " + program + " worked.");
                }

            }
        }

        outputFailedToPrint.close();
        outputfailedToParsePrettyPrinted.close();
        outputAstsAreDifferent.close();
        outputPrettyPrintedCorrectly.close();
    }

    private static void deletePrettyPrinted(List<String> programs) {
        for(String program : programs) {
            File f = new File("data/" + program + ".norm.pp.sdf3pp.hs");
            if(f.delete()) {
                System.out.println("Deleted file " + f.getPath());
            }
        }
    }

    private static void run(String[] args, boolean remote) {
        final Runner runner = injector.getInstance(Runner.class);
        runner.run(args, remote);
    }
}
