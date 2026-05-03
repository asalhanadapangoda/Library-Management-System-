<%@ include file="../header.jsp" %>

<h1>Review Moderation</h1>

<div class="card" style="padding: 0;">
    <table class="data-table">
        <thead>
            <tr>
                <th>User</th>
                <th>Book ID</th>
                <th>Rating</th>
                <th>Comment</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="r" items="${reviews}">
                <tr>
                    <td><strong>${r.userName}</strong></td>
                    <td>${r.bookId}</td>
                    <td>
                        <c:forEach begin="1" end="${r.rating}"><i class="fas fa-star" style="color: var(--accent);"></i></c:forEach>
                    </td>
                    <td>${r.comment}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/reviews?action=delete&id=${r.id}" class="btn btn-danger" style="padding: 0.25rem 0.5rem;"><i class="fas fa-trash"></i> Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>
