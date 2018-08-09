package org.metaborg;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;

import org.apache.commons.io.FileUtils;

import com.google.common.base.Charsets;
import com.google.common.io.Files;

public class FixExplicitLayoutFiles {
    
    public static void main(String[] args) throws Exception {
        File csvFile = new File("resources/files/files-without-module.csv");
        File newFiles = new File("resources/files/files-with-module.csv");
        final BufferedWriter newFilesWriter = new BufferedWriter(new FileWriter(newFiles));
        
        
        BufferedReader br = null;
        String line = "";
        br = new BufferedReader(new FileReader(csvFile));
        while((line = br.readLine()) != null) {
            File currentFile = new File("data/" + line);
            String module = "\nmodule " + getModuleName(Files.getNameWithoutExtension(line)) + " where\n";
            
            File modifiedFile = new File("data/" + line + "-mod.hs");
            final BufferedWriter outputModifiedFile = new BufferedWriter(new FileWriter(modifiedFile));
            
            String fileContents = FileUtils.readFileToString(currentFile, Charsets.UTF_8);
            
            int i = fileContents.indexOf("import");
            if(i == -1 || i == 0) {
                outputModifiedFile.write(module);
                outputModifiedFile.write(fileContents);
            } else {
                outputModifiedFile.write(fileContents.substring(0, i-1));
                outputModifiedFile.write(module);
                outputModifiedFile.write(fileContents.substring(i));
            }
            
            outputModifiedFile.close();
            newFilesWriter.write(modifiedFile.getPath() + "\n");
        }
        br.close();
        newFilesWriter.close();
        
        
    }

    private static String getModuleName(String fileName) {
        return (fileName.substring(0, 1).toUpperCase() + fileName.substring(1)).replace("-", "_");
    }
}
