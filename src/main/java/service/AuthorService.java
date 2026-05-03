package service;

import model.Author;
import java.util.ArrayList;
import java.util.List;

public class AuthorService {
    private static final String FILE_NAME = "authors.txt";

    public void addAuthor(Author author) {
        List<String> lines = new ArrayList<>();
        lines.add(author.toString());
        FileHandler.writeToFile(FILE_NAME, lines, true);
    }

    public List<Author> getAllAuthors() {
        List<String> lines = FileHandler.readFromFile(FILE_NAME);
        List<Author> authors = new ArrayList<>();
        for (String line : lines) {
            String[] parts = line.split("\\|");
            if (parts.length >= 4) {
                authors.add(new Author(parts[0], parts[1], parts[2], parts[3]));
            }
        }
        return authors;
    }

    public Author findById(String id) {
        for (Author a : getAllAuthors()) {
            if (a.getId().equals(id)) return a;
        }
        return null;
    }

    public void updateAuthor(Author updated) {
        List<Author> all = getAllAuthors();
        List<String> lines = new ArrayList<>();
        for (Author a : all) {
            if (a.getId().equals(updated.getId())) {
                lines.add(updated.toString());
            } else {
                lines.add(a.toString());
            }
        }
        FileHandler.writeToFile(FILE_NAME, lines, false);
    }

    public void deleteAuthor(String id) {
        List<Author> all = getAllAuthors();
        List<String> lines = new ArrayList<>();
        for (Author a : all) {
            if (!a.getId().equals(id)) {
                lines.add(a.toString());
            }
        }
        FileHandler.writeToFile(FILE_NAME, lines, false);
    }
}
