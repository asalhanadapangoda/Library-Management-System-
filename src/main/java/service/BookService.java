package service;

import model.Book;
import model.EBook;
import model.PrintedBook;
import java.util.ArrayList;
import java.util.List;

public class BookService {
    private static final String FILE_NAME = "books.txt";

    public void addBook(Book book) {
        List<String> lines = new ArrayList<>();
        lines.add(book.toString());
        FileHandler.writeToFile(FILE_NAME, lines, true);
    }

    public List<Book> getAllBooks() {
        List<String> lines = FileHandler.readFromFile(FILE_NAME);
        List<Book> books = new ArrayList<>();
        for (String line : lines) {
            String[] parts = line.split("\\|");
            if (parts[0].equals("EBOOK")) {
                books.add(new EBook(parts[1], parts[2], parts[3], parts[4], parts[5], Integer.parseInt(parts[6]), parts[7], parts[8]));
            } else if (parts[0].equals("PRINTED")) {
                books.add(new PrintedBook(parts[1], parts[2], parts[3], parts[4], parts[5], Integer.parseInt(parts[6]), Double.parseDouble(parts[7]), parts[8]));
            }
        }
        return books;
    }

    public Book findById(String id) {
        for (Book b : getAllBooks()) {
            if (b.getId().equals(id)) return b;
        }
        return null;
    }

    public void updateBook(Book updatedBook) {
        List<Book> books = getAllBooks();
        List<String> lines = new ArrayList<>();
        for (Book b : books) {
            if (b.getId().equals(updatedBook.getId())) {
                lines.add(updatedBook.toString());
            } else {
                lines.add(b.toString());
            }
        }
        FileHandler.writeToFile(FILE_NAME, lines, false);
    }

    public void deleteBook(String id) {
        List<Book> books = getAllBooks();
        List<String> lines = new ArrayList<>();
        for (Book b : books) {
            if (!b.getId().equals(id)) {
                lines.add(b.toString());
            }
        }
        FileHandler.writeToFile(FILE_NAME, lines, false);
    }

    public List<Book> searchBooks(String query) {
        List<Book> results = new ArrayList<>();
        for (Book b : getAllBooks()) {
            if (b.getTitle().toLowerCase().contains(query.toLowerCase()) || 
                b.getAuthor().toLowerCase().contains(query.toLowerCase()) ||
                b.getGenre().toLowerCase().contains(query.toLowerCase())) {
                results.add(b);
            }
        }
        return results;
    }
}
