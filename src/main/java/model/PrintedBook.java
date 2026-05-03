package model;

public class PrintedBook extends Book {
    private double weight;
    private String shelfLocation;

    public PrintedBook() { super(); }

    public PrintedBook(String id, String title, String author, String genre, String isbn, int quantity, double weight, String shelfLocation) {
        super(id, title, author, genre, isbn, quantity);
        this.weight = weight;
        this.shelfLocation = shelfLocation;
    }

    public double getWeight() { return weight; }
    public void setWeight(double weight) { this.weight = weight; }

    public String getShelfLocation() { return shelfLocation; }
    public void setShelfLocation(String shelfLocation) { this.shelfLocation = shelfLocation; }

    @Override
    public String getBookType() { return "Printed Book"; }

    @Override
    public String getDisplayDetails() {
        return "Physical Book [Shelf: " + shelfLocation + "]";
    }

    @Override
    public String toString() {
        return "PRINTED|" + super.toString() + "|" + weight + "|" + shelfLocation;
    }
}
