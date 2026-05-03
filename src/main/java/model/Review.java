package model;

import java.io.Serializable;

public class Review implements Serializable {
    private String id;
    private String bookId;
    private String userId;
    private String userName;
    private int rating;
    private String comment;
    private String type; // PUBLIC or VERIFIED

    public Review() {}

    public Review(String id, String bookId, String userId, String userName, int rating, String comment, String type) {
        this.id = id;
        this.bookId = bookId;
        this.userId = userId;
        this.userName = userName;
        this.rating = rating;
        this.comment = comment;
        this.type = type;
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getBookId() { return bookId; }
    public void setBookId(String bookId) { this.bookId = bookId; }

    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }

    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }

    public int getRating() { return rating; }
    public void setRating(int rating) { this.rating = rating; }

    public String getComment() { return comment; }
    public void setComment(String comment) { this.comment = comment; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }

    @Override
    public String toString() {
        return id + "|" + bookId + "|" + userId + "|" + userName + "|" + rating + "|" + comment + "|" + type;
    }
}
