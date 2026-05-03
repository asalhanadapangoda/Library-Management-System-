<%@ include file="../header.jsp" %>
<%@ page import="service.ReviewService" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Review" %>

<div style="display: grid; grid-template-columns: 1fr 2fr; gap: 2rem;">
    <div class="card" style="text-align: center;">
        <i class="fas fa-book" style="font-size: 5rem; color: var(--primary); margin-bottom: 1.5rem;"></i>
        <h2>${book.title}</h2>
        <p style="color: var(--text-muted);">by ${book.author}</p>
        <hr style="margin: 1.5rem 0; opacity: 0.1;">
        <div style="text-align: left; font-size: 0.95rem;">
            <p><strong>Genre:</strong> ${book.genre}</p>
            <p><strong>ISBN:</strong> ${book.isbn}</p>
            <p><strong>Type:</strong> ${book.getBookType()}</p>
            <p><strong>Details:</strong> ${book.getDisplayDetails()}</p>
            <p><strong>Available:</strong> ${book.quantity}</p>
        </div>
        
        <c:if test="${not empty sessionScope.user}">
            <c:choose>
                <c:when test="${book.quantity > 0}">
                    <a href="${pageContext.request.contextPath}/borrow?action=borrow&bookId=${book.id}" class="btn btn-primary" style="width: 100%; margin-top: 1rem;">Borrow Now</a>
                </c:when>
                <c:otherwise>
                    <button class="btn btn-outline" style="width: 100%; margin-top: 1rem;" disabled>Out of Stock</button>
                </c:otherwise>
            </c:choose>
        </c:if>
    </div>

    <div>
        <div class="card">
            <h3>Community Reviews</h3>
            <% 
                ReviewService rs = new ReviewService();
                String bId = ((model.Book)request.getAttribute("book")).getId();
                List<Review> reviews = rs.getByBookId(bId);
                if (reviews.isEmpty()) {
            %>
                <p style="color: var(--text-muted); margin-top: 1rem;">No reviews yet. Be the first!</p>
            <% } else { %>
                <div style="margin-top: 1.5rem;">
                    <% for(Review r : reviews) { %>
                        <div style="border-bottom: 1px solid #f1f5f9; padding-bottom: 1rem; margin-bottom: 1rem;">
                            <div style="display: flex; justify-content: space-between; align-items: center;">
                                <strong><%= r.getUserName() %></strong>
                                <span style="color: var(--accent);">
                                    <% for(int i=0; i<r.getRating(); i++) { %><i class="fas fa-star"></i><% } %>
                                </span>
                            </div>
                            <p style="margin-top: 0.5rem; font-size: 0.9rem;"><%= r.getComment() %></p>
                        </div>
                    <% } %>
                </div>
            <% } %>
        </div>

        <c:if test="${not empty sessionScope.user}">
            <div class="card">
                <h3>Leave a Review</h3>
                <form action="${pageContext.request.contextPath}/reviews" method="POST" style="margin-top: 1rem;">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="bookId" value="${book.id}">
                    <div class="form-group">
                        <label>Rating</label>
                        <select name="rating" class="form-control">
                            <option value="5">5 - Excellent</option>
                            <option value="4">4 - Good</option>
                            <option value="3">3 - Average</option>
                            <option value="2">2 - Poor</option>
                            <option value="1">1 - Terrible</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Comment</label>
                        <textarea name="comment" class="form-control" rows="3" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-outline">Submit Review</button>
                </form>
            </div>
        </c:if>
    </div>
</div>

<%@ include file="../footer.jsp" %>
