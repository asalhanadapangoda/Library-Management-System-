package model;

public class EBook extends Book {
    private String fileSize; // e.g., "5MB"
    private String format;   // e.g., "PDF", "EPUB"

    public EBook() { super(); }

    public EBook(String id, String title, String author, String genre, String isbn, int quantity, String fileSize, String format) {
        super(id, title, author, genre, isbn, quantity);
        this.fileSize = fileSize;
        this.format = format;
    }

    public String getFileSize() { return fileSize; }
    public void setFileSize(String fileSize) { this.fileSize = fileSize; }

    public String getFormat() { return format; }
    public void setFormat(String format) { this.format = format; }

    @Override
    public String getBookType() { return "E-Book"; }

    @Override
    public String getDisplayDetails() {
        return "Digital Book [" + format + ", " + fileSize + "]";
    }

    @Override
    public String toString() {
        return "EBOOK|" + super.toString() + "|" + fileSize + "|" + format;
    }
}
