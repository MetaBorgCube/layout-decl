package org.metaborg;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
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
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.metaborg.characterclasses.CharacterClassFactory;
import org.metaborg.parsetable.IParseTable;
import org.metaborg.parsetable.IProduction;
import org.metaborg.sdf2table.grammar.LayoutConstraintAttribute;
import org.metaborg.sdf2table.parsetable.ParseTableProduction;
import org.spoofax.interpreter.terms.IStrategoAppl;
import org.spoofax.interpreter.terms.IStrategoTerm;
import org.spoofax.interpreter.terms.ITermFactory;
import org.spoofax.jsglr.client.Disambiguator;
import org.spoofax.jsglr.client.ParseTable;
import org.spoofax.jsglr.client.SGLR;
import org.spoofax.jsglr.client.SGLRParseResult;
import org.spoofax.jsglr.client.imploder.TermTreeFactory;
import org.spoofax.jsglr.client.imploder.TreeBuilder;
import org.spoofax.jsglr2.JSGLR2;
import org.spoofax.jsglr2.actions.ActionsFactory;
import org.spoofax.jsglr2.parsetable.ParseTableReader;
import org.spoofax.jsglr2.states.StateFactory;
import org.spoofax.terms.TermFactory;
import org.spoofax.terms.attachments.ParentTermFactory;
import org.spoofax.terms.io.binary.TermReader;

import com.google.common.base.Charsets;
import com.google.common.collect.Lists;

public class LayoutSensitiveParsingCorrectness {
    private final static boolean parseSDF2JSGLR1 = false;
    private final static boolean parseSDF3JSGLR1 = false;
    private final static boolean parseSDF3JSGLR2 = false;
    private final static boolean VERIFY = true;
    private static boolean SHORTRUN = false;

    private final static LayoutType layoutType = LayoutType.ORIGINAL;

    public static void main(String[] args) throws Exception {
        Logger.getRootLogger().setLevel(Level.OFF);
        
        File results = new File("Results/pp");
		
		if(!results.exists()) {
			results.mkdirs();
		}
		
		if(args.length > 0) {
            SHORTRUN  = Boolean.parseBoolean(args[0]);
        }
        
        if(SHORTRUN) {
            System.out.println("\n-- Running short version of the experiment --\n\n ");
        }

        // load all files
        final Path filesThatDoNotParsePath = Paths.get("resources/files/files-do-not-parse.csv");

        final Set<String> filesThatDoNotParse =
            Files.readAllLines(filesThatDoNotParsePath).stream().collect(Collectors.toSet());

        final Path filesThatDoNotParseLongestMatchPath = Paths.get("resources/files/files-do-not-parse-no-module.csv");

        final Set<String> filesThatDoNotParseLongestMatch =
            Files.readAllLines(filesThatDoNotParseLongestMatchPath).stream().collect(Collectors.toSet());

        List<String> input = Lists.newArrayList();
        List<String> programs = Lists.newArrayList();
        BufferedReader br = null;
        String line = "";
        File csvFile = new File("resources/files/files.csv");

        System.out.println("Loading files.");

        File failedToLoad = new File("Results/failedToLoad.txt");

        final BufferedWriter outputFailedToLoad = new BufferedWriter(new FileWriter(failedToLoad));

        br = new BufferedReader(new FileReader(csvFile));
        while((line = br.readLine()) != null) {
            File currentFile = new File("data/" + line);
            String pkg = line.substring(0, line.indexOf("/"));

            if(layoutType == LayoutType.EXPLICIT) {
                if(currentFile.exists() && !filesThatDoNotParse.contains(line)
                    && !filesThatDoNotParseLongestMatch.contains(line)) {
                    File preprocessedFile = new File("data/" + line + ".norm.pp.expl.hs");
                    if(preprocessedFile.exists()) {
//                        System.out.println("Loaded preprocessed file " + line);
                        input.add(FileUtils.readFileToString(preprocessedFile, Charsets.UTF_8));
                        // System.out.println(FileUtils.readFileToString(preprocessedFile, Charsets.UTF_8));
                        programs.add(line);
                    } else {
                        File preparedFile = PrepareFile.prepareFileExplicit(currentFile, pkg);
                        if(preparedFile != null) {
//                            System.out.println("Loaded " + line);
                            input.add(FileUtils.readFileToString(preparedFile, Charsets.UTF_8));
                            // System.out.println(FileUtils.readFileToString(preparedFile, Charsets.UTF_8));
                            programs.add(line);
                        } else {
                            System.out.println("Failed to load " + line);
                            outputFailedToLoad.write("failed to load: " + line + "\n");
                        }
                    }
                }
            } else {
                if(currentFile.exists() && !filesThatDoNotParse.contains(line)
                    && !filesThatDoNotParseLongestMatch.contains(line)) {
                    File preprocessedFile = new File("data/" + line + ".norm.pp.hs");
                    if(preprocessedFile.exists()) {
//                        System.out.println("Loaded preprocessed file " + line);
                        input.add(FileUtils.readFileToString(preprocessedFile, Charsets.UTF_8));
                        programs.add(line);
                    } else {
                        File preparedFile = PrepareFile.prepareFile(currentFile, pkg);
                        if(preparedFile != null) {
//                            System.out.println("Loaded " + line);
                            input.add(FileUtils.readFileToString(preparedFile, Charsets.UTF_8));
                            programs.add(line);
                        } else {
                            System.out.println("Failed to load " + line);
                            outputFailedToLoad.write("failed to load: " + line + "\n");
                        }
                    }
                } else if (!currentFile.exists() && !filesThatDoNotParse.contains(line)
                    && !filesThatDoNotParseLongestMatch.contains(line)) {
                    System.out.println("Failed to load " + line);
                    outputFailedToLoad.write("failed to load: " + line + "\n");
                }
            }
        }
        br.close();
        outputFailedToLoad.close();

        System.out.println("Loaded " + input.size() + " files.");
        
        if(SHORTRUN) {
            List<Integer> indexes = Lists.newArrayList();
            for(int i = 0; i < programs.size(); i++) {
                indexes.add(i);
            }
            Collections.shuffle(indexes);
            List<String> randomPrograms = Lists.newArrayList();
            List<String> randomInputs = Lists.newArrayList();

            for(int i = 0; i < 1000; i++) {
                randomPrograms.add(programs.get(indexes.get(i)));
                randomInputs.add(input.get(indexes.get(i)));
            }

            programs.clear();
            programs.addAll(randomPrograms);
            input.clear();
            input.addAll(randomInputs);
            System.out.println("\nRunning short version on " + input.size() + " programs.\n");
        }

        final ITermFactory termFactory = new TermFactory();
        final TermReader termReader = new TermReader(termFactory);
        final TermTreeFactory factory = new TermTreeFactory(new ParentTermFactory(termFactory));

        // parse files with SDF2 and JSGLR1
        if(parseSDF2JSGLR1) {
            System.out.println("Loading SDF2 parse table.");
            IStrategoTerm sdf2AtermPt = null;

            File tableFile = new File("resources/parseTables/sdf2/Haskell.tbl");
            if(tableFile.exists()) {
                sdf2AtermPt = termReader.parseFromFile("resources/parseTables/sdf2/Haskell.tbl");
            }

            final ParseTable sdf2Pt = new ParseTable(sdf2AtermPt, termFactory);

            System.out.println("Loaded parse table.");
            final SGLR parser = new SGLR(new TreeBuilder(factory), sdf2Pt);

            File file = new File("Results/log.txt");
            File parsedFiles = new File("Results/parsedFiles.txt");
            System.out.println("Parsing with JSGLR1 and SDF2.");
            parseFiles(input, programs, parser, file, parsedFiles);
            System.gc();
        }

        if(VERIFY) {
            // parse files with SDF3 and JSGLR1 and JSGLR2 and compare the ASTs
            System.out.println("Loading SDF3 parse table.");
            IStrategoTerm sdf3AtermPt = null;

            File sdf3TableFile = new File("resources/parseTables/sdf3/Haskell.tbl");
            if(sdf3TableFile.exists()) {
                sdf3AtermPt = termReader.parseFromFile("resources/parseTables/sdf3/Haskell.tbl");
            }

            final ParseTable sdf3Pt = new ParseTable(sdf3AtermPt, termFactory);

            FileSystemManager fsManager = VFS.getManager();
            FileObject persistedTable = fsManager.resolveFile(sdf3TableFile.getParentFile(), "table.bin"); // resolveFile("resources/parseTables/sdf3/",
                                                                                                           // "table.bin");
            IParseTable parseTable = new ParseTableReader(new CharacterClassFactory(true, true),
                new ActionsFactory(true), new StateFactory()).read(sdf3AtermPt, persistedTable);
            
            normalizeLayoutConstraints(parseTable);

            System.out.println("Loaded SDF3 parse table.");

            final SGLR JSLGRParser = new SGLR(new TreeBuilder(factory), sdf3Pt);
            JSGLR2<?, IStrategoTerm> JSGLR2parser = JSGLR2.layoutSensitive(parseTable);

            File logFile = new File("Results/verifylog.txt");
            File logParsedFiles = new File("Results/verifyParsedFiles.txt");

            parseFilesVerify(input, programs, JSLGRParser, JSGLR2parser, logFile, logParsedFiles);

        } else {

            // parse files with SDF3 and JSGLR1
            if(parseSDF3JSGLR1) {
                System.out.println("Loading SDF3/JSGLR1 parse table.");
                IStrategoTerm sdf3AtermPt = null;

                File sdf3TableFile = new File("resources/parseTables/sdf3/Haskell.tbl");
                if(sdf3TableFile.exists()) {
                    sdf3AtermPt = termReader.parseFromFile("resources/parseTables/sdf3/Haskell.tbl");
                }

                final ParseTable sdf3Pt = new ParseTable(sdf3AtermPt, termFactory);

                File sdf3File = new File("Results/sdf3log.txt");
                File sdf3ParsedFiles = new File("Results/sdf3parsedFiles.txt");
                System.out.println("Loaded SDF3/JSGLR1 parse table.");
                final SGLR sdf3Parser = new SGLR(new TreeBuilder(factory), sdf3Pt);
                System.out.println("Parsing with JSGLR1 and SDF3.");
                parseFiles(input, programs, sdf3Parser, sdf3File, sdf3ParsedFiles);
                System.gc();
            }



            // parse files with SDF3 and JSGLR2
            if(parseSDF3JSGLR2) {
                IStrategoTerm sdf3AtermPt = null;
                System.out.println("Loading SDF3/JSGLR2 parse table.");

                File sdf3TableFile = new File("../HaskellSDF3NoTemplates/target/metaborg/sdf.tbl");
                if(sdf3TableFile.exists()) {
                    sdf3AtermPt = termReader.parseFromFile("../HaskellSDF3NoTemplates/target/metaborg/sdf.tbl");
                }
                FileSystemManager fsManager = VFS.getManager();
                FileObject persistedTable = fsManager.resolveFile(sdf3TableFile.getParentFile(), "table.bin"); // resolveFile("resources/parseTables/sdf3/",
                                                                                                               // "table.bin");
                IParseTable parseTable = new ParseTableReader(new CharacterClassFactory(true, true),
                    new ActionsFactory(true), new StateFactory()).read(sdf3AtermPt, persistedTable);
                JSGLR2<?, IStrategoTerm> parser;
                if(layoutType.equals(LayoutType.ORIGINAL)) {
                    parser = JSGLR2.layoutSensitive(parseTable);
                } else {
                    parser = JSGLR2.naive(parseTable);
                }
                System.out.println("Loaded SDF3/JSGLR2 parse table.");
                File sdf3FileJSGLR2 = new File("Results/sdf3logJSGLR2.txt");
                File sdf3ParsedFilesJSGLR2 = new File("Results/sdf3parsedFilesJSGLR2.txt");
                System.out.println("Parsing with JSGLR2 and SDF3.");
                parseFilesJSGLR2(input, programs, parser, sdf3FileJSGLR2, sdf3ParsedFilesJSGLR2);

            }
        }
    }

    private static void parseFilesVerify(List<String> input, List<String> programs, SGLR parser1,
        JSGLR2<?, IStrategoTerm> parser2, File logFile, File logParsedFiles) throws Exception {
        final BufferedWriter output = new BufferedWriter(new FileWriter(logFile));
        final BufferedWriter parsedFilesOutput = new BufferedWriter(new FileWriter(logParsedFiles));

        // parse all files with JSGLR2 and JSGLR1
        try {
            input.stream().forEach(program -> {
                try {
                    final Disambiguator disambiguator = parser1.getDisambiguator();
                    disambiguator.setFilterPriorities(false);
                    disambiguator.setFilterAssociativity(false);
                    SGLRParseResult pr = parser1.parse(program, programs.get(input.indexOf(program)), "Module");
                    IStrategoTerm astParser1 = (IStrategoTerm) pr.output;
                    IStrategoTerm astParser2 = parser2.parse(program, programs.get(input.indexOf(program)), "Module");
                    boolean astJSGLR1 = containsAmbNodes(astParser1);
                    boolean astJSGLR2 = containsAmbNodes(astParser2);

                    if(astJSGLR1) {
                        output.write("AST from JSGLR1 parser for program " + programs.get(input.indexOf(program))
                            + " contains ambiguities." + "\n");
                        System.out.println("AST from JSGLR1 parser for program " + programs.get(input.indexOf(program))
                            + " contains ambiguities.");
                    } else if(astJSGLR2) {
                        output.write("AST from JSGLR2 parser for program " + programs.get(input.indexOf(program))
                            + " contains ambiguities." + "\n");
                        System.out.println("AST from JSGLR2 parser for program " + programs.get(input.indexOf(program))
                            + " contains ambiguities.");
                    } else if(!astParser1.equals(astParser2)) {
                        output.write("ASTs from JSGLR1 and JSGL2 for program " + programs.get(input.indexOf(program))
                            + " are different." + "\n");
                        System.out.println("ASTs from JSGLR1 and JSGL2 for program "
                            + programs.get(input.indexOf(program)) + "  are different.");
                        // System.out.println(astParser1);
                        // System.out.println("\n\n");
                        // System.out.println(astParser2);
                    } else {
                        parsedFilesOutput.write(programs.get(input.indexOf(program)) + "\n");
                        System.out.println("Processed File: " + programs.get(input.indexOf(program)));
                    }
                } catch(Exception e) {
                    try {
                        output.write("Could not parse file: " + programs.get(input.indexOf(program)) + "\n");
                        System.out.println("Could not parse file: " + programs.get(input.indexOf(program)));
                    } catch(IOException e1) {
                        System.out.println("output is invalid");
                    }
                } catch(StackOverflowError | OutOfMemoryError err) {
                    try {
                        output.write("Could not parse file (StackOverflowError) : "
                            + programs.get(input.indexOf(program)) + "\n");
                        System.out.println("Could not parse file: " + programs.get(input.indexOf(program)));
                    } catch(IOException e1) {
                        System.out.println("output is invalid");
                    }
                }
            });
        } finally {
            parsedFilesOutput.close();
            output.close();
        }
    }

    private static void parseFilesJSGLR2(List<String> input, List<String> programs, JSGLR2<?, IStrategoTerm> parser,
        File file, File parsedFiles) throws IOException {
        final BufferedWriter output = new BufferedWriter(new FileWriter(file));
        final BufferedWriter parsedFilesOutput = new BufferedWriter(new FileWriter(parsedFiles));

        // parse all files with parse table from SDF2 and JSGLR1
        try {
            for(int i = 0; i < input.size(); i++) {
                String program = input.get(i);
                try {
                    IStrategoTerm astParser1 = parser.parse(program, programs.get(i), "Module");
                    if(containsAmbNodes(astParser1)) {
                        output.write("AST for program " + programs.get(i)
                            + " contains ambiguities." + "\n");
                        System.out.println(
                            i + " AST for program " + programs.get(i) + " contains ambiguities.");
                    } else {
                        parsedFilesOutput.write((i+1) + " " + programs.get(i) + "\n");
                        System.out.println(i + " Processed File: " + programs.get(i));
                    }
                } catch(Exception e) {
                    try {
                        output.write("Could not parse file: " + programs.get(i) + "\n");
                        System.out.println("Could not parse file: " + programs.get(i));
                    } catch(IOException e1) {
                        System.out.println("output is invalid");
                    }
                } catch(StackOverflowError | OutOfMemoryError err) {
                    try {
                        output.write("Could not parse file (StackOverflowError) : "
                            + programs.get(input.indexOf(program)) + "\n");
                        System.out.println("Could not parse file: " + programs.get(i));
                    } catch(IOException e1) {
                        System.out.println("output is invalid");
                    }
                }
            }
        } finally {
            parsedFilesOutput.close();
            output.close();
        }

    }

    private static void parseFiles(List<String> input, List<String> programs, final SGLR parser, File file,
        File parsedFiles) throws IOException {
        final BufferedWriter output = new BufferedWriter(new FileWriter(file));
        final BufferedWriter parsedFilesOutput = new BufferedWriter(new FileWriter(parsedFiles));

        // parse all files with parse table from SDF2 and JSGLR1
        try {
            input.stream().forEach(program -> {
                try {
                    final Disambiguator disambiguator = parser.getDisambiguator();
                    disambiguator.setFilterPriorities(false);
                    disambiguator.setFilterAssociativity(false);
                    SGLRParseResult pr = parser.parse(program, programs.get(input.indexOf(program)), "Module");
                    IStrategoTerm astParser1 = (IStrategoTerm) pr.output;
                    if(containsAmbNodes(astParser1)) {
                        output.write("AST for program " + programs.get(input.indexOf(program))
                            + " contains ambiguities." + "\n");
                        System.out.println(
                            "AST for program " + programs.get(input.indexOf(program)) + " contains ambiguities.");
                    } else {
                        parsedFilesOutput.write(programs.get(input.indexOf(program)) + "\n");
                        System.out.println("Processed File: " + programs.get(input.indexOf(program)));
                    }
                } catch(Exception e) {
                    try {
                        output.write("Could not parse file: " + programs.get(input.indexOf(program)) + "\n");
                        System.out.println("Could not parse file: " + programs.get(input.indexOf(program)));
                    } catch(IOException e1) {
                        System.out.println("output is invalid");
                    }
                } catch(StackOverflowError err) {
                    try {
                        output.write("Could not parse file (StackOverflowError) : "
                            + programs.get(input.indexOf(program)) + "\n");
                        System.out.println("Could not parse file: " + programs.get(input.indexOf(program)));
                    } catch(IOException e1) {
                        System.out.println("output is invalid");
                    }
                }
            });
        } finally {
            parsedFilesOutput.close();
            output.close();
        }
    }

    private static boolean containsAmbNodes(IStrategoTerm ast) {

        if(ast instanceof IStrategoAppl) {
            IStrategoAppl amb = (IStrategoAppl) ast;
            if(amb.getConstructor().getName().equals("amb")) {
                return true;
            }
        }

        for(IStrategoTerm child : ast.getAllSubterms()) {
            if(containsAmbNodes(child)) {
                return true;
            }
        }

        return false;
    }

    private static void normalizeLayoutConstraints(IParseTable parseTable) {
        if(parseTable instanceof org.metaborg.sdf2table.parsetable.ParseTable) {
            for(IProduction p : ((org.metaborg.sdf2table.parsetable.ParseTable) parseTable).productions()) {
                if(p instanceof ParseTableProduction) {
                    if(!((ParseTableProduction) p).getLayoutConstraints().isEmpty()) {
                        for(LayoutConstraintAttribute lc : ((ParseTableProduction) p).getLayoutConstraints()) {
                            lc.getLayoutConstraint().normalizeConstraint(((ParseTableProduction) p).getProduction().rightHand());
                        }
                    }
                }
            }
        }
    }



}
