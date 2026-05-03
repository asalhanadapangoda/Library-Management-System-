package model;

import java.io.Serializable;

public class Author implements Serializable {
    private String id;
    private String name;
    private String bio;
    private String booksWritten;

    public Author() {}

    public Author(String id, String name, String bio, String booksWritten) {
        this.id = id;
        this.name = name;
        this.bio = bio;
        this.booksWritten = booksWritten;
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getBio() { return bio; }
    public void setBio(String bio) { this.bio = bio; }

    public String getBooksWritten() { return booksWritten; }
    public void setBooksWritten(String booksWritten) { this.booksWritten = booksWritten; }

    @Override
    public String toString() {
        return id + "|" + name + "|" + bio + "|" + booksWritten;
    }
}
