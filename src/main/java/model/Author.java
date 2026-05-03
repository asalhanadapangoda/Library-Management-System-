package model;

import java.io.Serializable;

public class Author implements Serializable {
    private String id;
    private String name;
    private String bio;
    private String authorType; // GUEST or PERMANENT

    public Author() {}

    public Author(String id, String name, String bio, String authorType) {
        this.id = id;
        this.name = name;
        this.bio = bio;
        this.authorType = authorType;
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getBio() { return bio; }
    public void setBio(String bio) { this.bio = bio; }

    public String getAuthorType() { return authorType; }
    public void setAuthorType(String authorType) { this.authorType = authorType; }

    @Override
    public String toString() {
        return id + "|" + name + "|" + bio + "|" + authorType;
    }
}
