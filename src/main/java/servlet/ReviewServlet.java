package servlet;

import model.Review;
import model.User;
import service.ReviewService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@WebServlet("/reviews")
public class ReviewServlet extends HttpServlet {
    private ReviewService reviewService = new ReviewService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("list".equals(action)) {
            String bookId = request.getParameter("bookId");
            List<Review> reviews = reviewService.getByBookId(bookId);
            request.setAttribute("reviews", reviews);
            request.getRequestDispatcher("books/details.jsp").forward(request, response);
        } else if ("moderate".equals(action)) {
            List<Review> all = reviewService.getAllReviews();
            request.setAttribute("reviews", all);
            request.getRequestDispatcher("/admin/reviews.jsp").forward(request, response);
        } else if ("delete".equals(action)) {
            reviewService.deleteReview(request.getParameter("id"));
            response.sendRedirect("reviews?action=moderate");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        User user = (User) request.getSession().getAttribute("user");
        
        if ("add".equals(action) && user != null) {
            String bookId = request.getParameter("bookId");
            int rating = Integer.parseInt(request.getParameter("rating"));
            String comment = request.getParameter("comment");
            String id = UUID.randomUUID().toString().substring(0, 8);
            
            Review review = new Review(id, bookId, user.getId(), user.getUsername(), rating, comment, "PUBLIC");
            reviewService.addReview(review);
            response.sendRedirect("books?action=details&id=" + bookId);
        }
    }
}
