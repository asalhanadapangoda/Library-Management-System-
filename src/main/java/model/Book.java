package model;

import java.io.Serializable;

public abstract class Book implements Serializable {
    private String id;
    private String title;
    private String author;
    private String genre;
    private String isbn;
    private int quantity;

    public Book() {}

    public Book(String id, String title, String author, String genre, String isbn, int quantity) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.genre = genre;
        this.isbn = isbn;
        this.quantity = quantity;
    }

    // Encapsulation
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getAuthor() { return author; }
    public void setAuthor(String author) { this.author = author; }

    public String getGenre() { return genre; }
    public void setGenre(String genre) { this.genre = genre; }

    public String getIsbn() { return isbn; }
    public void setIsbn(String isbn) { this.isbn = isbn; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public abstract String getBookType();
    public abstract String getDisplayDetails();

    @Override
    public String toString() {
        return id + "|" + title + "|" + author + "|" + genre + "|" + isbn + "|" + quantity;
    }
}
