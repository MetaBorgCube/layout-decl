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

import com.google.common.collect.Lists;

public class CreateRandomFiles {
    public static void main(String[] args) throws FileNotFoundException, IOException {
            List<String> programs = Lists.newArrayList();

            readPrograms(programs);

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
            System.out.println("\nCreated file with " + programs.size() + " random programs.\n");

            File randomFiles = new File("resources/files/files-random.csv");
            final BufferedWriter outputRandomFiles = new BufferedWriter(new FileWriter(randomFiles));
            for(String p : programs) {
                outputRandomFiles.write(p + "\n");
            }
            outputRandomFiles.close();
        

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
                    // System.out.println("Loaded preprocessed file " + line);
                    programs.add(line);
                } else {
                    File preparedFile = PrepareFile.prepareFile(currentFile, pkg);
                    if(preparedFile != null) {
                        // System.out.println("Loaded " + line);
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
    }
}
