package service;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FileHandler {
    private static final String BASE_PATH = "C:\\Users\\User\\Desktop\\Libary Managment System\\";

    public static List<String> readFromFile(String filename) {
        List<String> lines = new ArrayList<>();
        File file = new File(BASE_PATH + filename);
        if (!file.exists()) {
            try {
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
            return lines;
        }
        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    lines.add(line);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return lines;
    }

    public static void writeToFile(String filename, List<String> lines, boolean append) {
        try (PrintWriter pw = new PrintWriter(new FileWriter(BASE_PATH + filename, append))) {
            for (String line : lines) {
                pw.println(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
