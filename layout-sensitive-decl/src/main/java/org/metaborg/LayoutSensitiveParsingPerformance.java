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
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

import org.apache.commons.io.FileUtils;
import org.apache.commons.vfs2.FileObject;
import org.apache.commons.vfs2.FileSystemManager;
import org.apache.commons.vfs2.VFS;
import org.apache.log4j.Logger;
import org.metaborg.characterclasses.CharacterClassFactory;
import org.metaborg.parsetable.IParseTable;
import org.openjdk.jmh.annotations.Benchmark;
import org.openjdk.jmh.annotations.Level;
import org.openjdk.jmh.annotations.Mode;
import org.openjdk.jmh.annotations.Param;
import org.openjdk.jmh.annotations.Scope;
import org.openjdk.jmh.annotations.Setup;
import org.openjdk.jmh.annotations.State;
import org.openjdk.jmh.infra.Blackhole;
import org.openjdk.jmh.results.format.ResultFormatType;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;
import org.spoofax.interpreter.terms.IStrategoTerm;
import org.spoofax.interpreter.terms.ITermFactory;
import org.spoofax.jsglr2.JSGLR2;
import org.spoofax.jsglr2.actions.ActionsFactory;
import org.spoofax.jsglr2.parsetable.ParseTableReader;
import org.spoofax.jsglr2.states.StateFactory;
import org.spoofax.terms.TermFactory;
import org.spoofax.terms.io.binary.TermReader;

import com.google.common.base.Charsets;
import com.google.common.collect.Lists;

@State(Scope.Benchmark)
public class LayoutSensitiveParsingPerformance {

    @Param({ "ORIGINAL" }) public static LayoutType a_lt;

    @State(Scope.Benchmark)
    public static class FileConfig {
        public File csvFile;
        public List<String> input;
        public List<String> programs;

        public List<String> inputNoLM;
        public List<String> programsNoLM;

        @Setup(Level.Trial) public void doSetup() throws IOException {
            final Path filesThatDoNotParsePath = Paths.get("resources/files/files-do-not-parse.csv");

            final Set<String> filesThatDoNotParse =
                Files.readAllLines(filesThatDoNotParsePath).stream().collect(Collectors.toSet());

            final Path filesThatDoNotParseNoModulePath = Paths.get("resources/files/files-do-not-parse-no-module.csv");

            final Set<String> filesThatDoNotParseNoModule =
                Files.readAllLines(filesThatDoNotParseNoModulePath).stream().collect(Collectors.toSet());

            final Path filesThatContainLongestMatchPath = Paths.get("resources/files/files-contain-lm-amb.csv");

            final Set<String> filesThatContainLongestMatch =
                Files.readAllLines(filesThatContainLongestMatchPath).stream().collect(Collectors.toSet());

            filesThatDoNotParse.addAll(filesThatDoNotParseNoModule);

            input = Lists.newArrayList();
            programs = Lists.newArrayList();

            csvFile = new File("resources/files/files.csv");
            
            readFiles(filesThatDoNotParse, input, programs);

            inputNoLM = Lists.newArrayList();
            programsNoLM = Lists.newArrayList();

            filesThatContainLongestMatch.addAll(filesThatDoNotParse);

            readFiles(filesThatContainLongestMatch, inputNoLM, programsNoLM);

            System.out.println("Loaded " + input.size() + " files.");
            System.out.println("Loaded " + inputNoLM.size() + " files that do not contain longest-match ambiguities.");

        }

        private void readFiles(final Set<String> filesThatDoNotParse, List<String> input, List<String> programs)
            throws FileNotFoundException, IOException {
            BufferedReader br;
            String line = "";
            br = new BufferedReader(new FileReader(csvFile));
            while((line = br.readLine()) != null) {
                File currentFile = new File("data/" + line);
                programs.add(line);
                String pkg = line.substring(0, line.indexOf("/"));
                File preparedFile;

                if(currentFile.exists() && !filesThatDoNotParse.contains(line)) {
                    File preprocessedFile;
                    if(a_lt.equals(LayoutType.ORIGINAL)) {
                        preprocessedFile = new File("data/" + line + ".norm.pp.hs");
                    } else {
                        preprocessedFile = new File("data/" + line + ".norm.pp.expl.hs");
                    }

                    // System.out.println(preprocessedFile);

                    if(preprocessedFile.exists()) {
                        // System.out.println("Loaded preprocessed file " + line);
                        input.add(FileUtils.readFileToString(preprocessedFile, Charsets.UTF_8));
                    } else {

                        if(a_lt.equals(LayoutType.ORIGINAL)) {
                            // System.out.println("Loading " + line + " with original layout.");
                            preparedFile = PrepareFile.prepareFile(currentFile, pkg);
                        } else {
                            // System.out.println("Loading " + line + " with explicit layout.");
                            preparedFile = PrepareFile.prepareFileExplicit(currentFile, pkg);
                        }

                        if(preparedFile != null) {
                            // System.out.println("Loaded " + line);
                            input.add(FileUtils.readFileToString(preparedFile, Charsets.UTF_8));
                        } else {
                            System.err.println("Failed to load " + line);
                        }
                    }
                }
            }
            br.close();
        }

        public long characterCount(List<String> input) {
            if(input == null) {
                return 0L;
            } else {
                long characterCount = input.stream().mapToInt(String::length).sum();

                return characterCount;
            }
        }
    }

    @State(Scope.Benchmark)
    public static class BenchmarkLanguages {
        public IParseTable pt;
        public JSGLR2<?, IStrategoTerm> parser;

        @Setup(Level.Trial) public void doSetup() throws Exception {
            IStrategoTerm sdf3AtermPt = null;
            final ITermFactory termFactory = new TermFactory();
            final TermReader termReader = new TermReader(termFactory);

            File sdf3TableFile = new File("../Haskell/target/metaborg/sdf.tbl");
            if(sdf3TableFile.exists()) {
                sdf3AtermPt = termReader.parseFromFile("../Haskell/target/metaborg/sdf.tbl");
            }
            FileSystemManager fsManager = VFS.getManager();
            FileObject persistedTable = fsManager.resolveFile(sdf3TableFile.getParentFile(), "table.bin"); // resolveFile("resources/parseTables/sdf3/",
                                                                                                           // "table.bin");
            pt = new ParseTableReader(new CharacterClassFactory(true, true), new ActionsFactory(true),
                new StateFactory()).read(sdf3AtermPt, persistedTable);

            if(a_lt.equals(LayoutType.ORIGINAL)) {
                parser = JSGLR2.layoutSensitive(pt);
            } else {
                parser = JSGLR2.naive(pt);
            }
        }
    }

    public static void main(String[] args) throws RunnerException, FileNotFoundException, IOException {

        Logger.getRootLogger().setLevel(org.apache.log4j.Level.OFF);
        File results = new File("Results/pp");

        if(!results.exists()) {
            results.mkdirs();
        }

        // @formatter:off
		Options options = new OptionsBuilder()
		    .warmupIterations(5)
		    .measurementIterations(10)
		    .mode(Mode.AverageTime)
				.param("a_lt", "ORIGINAL")
				.param("a_lt", "EXPLICIT")
			.forks(1)
			.threads(1)
			.shouldDoGC(true)
				.include(LayoutSensitiveParsingPerformance.class.getSimpleName() + ".parseFileNoLongestMatch")
				.include(LayoutSensitiveParsingPerformance.class.getSimpleName() + ".parseFile")
			.timeUnit(TimeUnit.SECONDS)
			.resultFormat(ResultFormatType.TEXT)
			.result("Results/performance-benchmark.txt").build();

		// @formatter:on
        new Runner(options).run();
    }

    @Benchmark public void parseFile(Blackhole bh, BenchmarkLanguages bl, FileConfig fc) throws IOException {

        fc.input.stream().forEach(program -> {
            try {
                bh.consume(bl.parser.parseUnsafeNoImploding(program));
            } catch(Exception e) {
                throw new RuntimeException(e);
            }
        });
    }

    @Benchmark public void parseFileNoLongestMatch(Blackhole bh, BenchmarkLanguages bl, FileConfig fc)
        throws IOException {

        fc.inputNoLM.stream().forEach(program -> {
            try {
                bh.consume(bl.parser.parseUnsafeNoImploding(program));
            } catch(Exception e) {
                throw new RuntimeException(e);
            }
        });
    }

}
