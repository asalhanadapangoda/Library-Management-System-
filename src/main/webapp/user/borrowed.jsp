<%@ include file="../header.jsp" %>
<%@ page import="service.BookService" %>
<%@ page import="service.BorrowService" %>
<%@ page import="model.Transaction" %>
<%@ page import="model.User" %>
<%@ page import="java.util.List" %>

<h2>My Borrowed Books</h2>

<div class="card" style="padding: 0;">
    <table class="data-table">
        <thead>
            <tr>
                <th>Book Title</th>
                <th>Borrowed On</th>
                <th>Due Date</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% 
                User user = (User) session.getAttribute("user");
                BorrowService bs = new BorrowService();
                BookService bks = new BookService();
                List<Transaction> trans = bs.getByUserId(user.getId());
                boolean found = false;
                for(Transaction t : trans) { 
                    if(t.getStatus().equals("BORROWED")) {
                        found = true;
            %>
                <tr>
                    <td><%= bks.findById(t.getBookId()).getTitle() %></td>
                    <td><%= t.getBorrowDate() %></td>
                    <td><span style="color: var(--danger); font-weight: 600;"><%= t.getDueDate() %></span></td>
                    <td><span style="padding: 0.25rem 0.5rem; border-radius: 9999px; font-size: 0.75rem; background: #fef3c7; color: #92400e;">BORROWED</span></td>
                    <td>
                        <form action="${pageContext.request.contextPath}/borrow" method="POST">
                            <input type="hidden" name="action" value="return">
                            <input type="hidden" name="transId" value="<%= t.getId() %>">
                            <button type="submit" class="btn btn-outline" style="padding: 0.25rem 0.75rem; font-size: 0.85rem;">Return</button>
                        </form>
                    </td>
                </tr>
            <% 
                    }
                } 
                if(!found) {
            %>
                <tr><td colspan="5" style="text-align: center; padding: 2rem; color: var(--text-muted);">No books borrowed currently.</td></tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>
