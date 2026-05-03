package model;

import java.io.Serializable;
import java.util.Date;

public class Transaction implements Serializable {
    private String id;
    private String userId;
    private String bookId;
    private String borrowDate;
    private String dueDate;
    private String returnDate;
    private String status; // "BORROWED", "RETURNED"
    private double fine;

    public Transaction() {}

    public Transaction(String id, String userId, String bookId, String borrowDate, String dueDate, String status) {
        this.id = id;
        this.userId = userId;
        this.bookId = bookId;
        this.borrowDate = borrowDate;
        this.dueDate = dueDate;
        this.status = status;
        this.fine = 0.0;
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }

    public String getBookId() { return bookId; }
    public void setBookId(String bookId) { this.bookId = bookId; }

    public String getBorrowDate() { return borrowDate; }
    public void setBorrowDate(String borrowDate) { this.borrowDate = borrowDate; }

    public String getDueDate() { return dueDate; }
    public void setDueDate(String dueDate) { this.dueDate = dueDate; }

    public String getReturnDate() { return returnDate; }
    public void setReturnDate(String returnDate) { this.returnDate = returnDate; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public double getFine() { return fine; }
    public void setFine(double fine) { this.fine = fine; }

    @Override
    public String toString() {
        return id + "|" + userId + "|" + bookId + "|" + borrowDate + "|" + dueDate + "|" + (returnDate == null ? "N/A" : returnDate) + "|" + status + "|" + fine;
    }
}
