package service;

import model.Review;
import java.util.ArrayList;
import java.util.List;

public class ReviewService {
    private static final String FILE_NAME = "reviews.txt";

    public void addReview(Review review) {
        List<String> lines = new ArrayList<>();
        lines.add(review.toString());
        FileHandler.writeToFile(FILE_NAME, lines, true);
    }

    public List<Review> getAllReviews() {
        List<String> lines = FileHandler.readFromFile(FILE_NAME);
        List<Review> reviews = new ArrayList<>();
        for (String line : lines) {
            String[] parts = line.split("\\|");
            if (parts.length >= 7) {
                reviews.add(new Review(parts[0], parts[1], parts[2], parts[3], Integer.parseInt(parts[4]), parts[5], parts[6]));
            }
        }
        return reviews;
    }

    public List<Review> getByBookId(String bookId) {
        List<Review> bookReviews = new ArrayList<>();
        for (Review r : getAllReviews()) {
            if (r.getBookId().equals(bookId)) {
                bookReviews.add(r);
            }
        }
        return bookReviews;
    }

    public void deleteReview(String id) {
        List<Review> all = getAllReviews();
        List<String> lines = new ArrayList<>();
        for (Review r : all) {
            if (!r.getId().equals(id)) {
                lines.add(r.toString());
            }
        }
        FileHandler.writeToFile(FILE_NAME, lines, false);
    }

    public void updateReview(Review updated) {
        List<Review> all = getAllReviews();
        List<String> lines = new ArrayList<>();
        for (Review r : all) {
            if (r.getId().equals(updated.getId())) {
                lines.add(updated.toString());
            } else {
                lines.add(r.toString());
            }
        }
        FileHandler.writeToFile(FILE_NAME, lines, false);
    }
}
