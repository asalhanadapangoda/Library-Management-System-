<%@ include file="../header.jsp" %>
<%@ page import="service.BookService" %>
<%@ page import="service.UserService" %>
<% 
    BookService bks = new BookService(); 
    UserService us = new UserService();
%>

<div class="card" style="max-width: 600px; margin: 0 auto;">
    <h2 style="margin-bottom: 0.5rem;"><i class="bi bi-hand-thumbs-up" style="color: #f472b6;"></i> Issue Book to Member</h2>
    <p style="color: var(--text-muted); margin-bottom: 2rem;">Manually assign an available book to a registered library member.</p>

    <c:if test="${param.error == 'invalid_issue'}">
        <div style="background: #fee2e2; color: #dc2626; padding: 1rem; border-radius: 0.5rem; margin-bottom: 1.5rem;">
            <strong>Error:</strong> Could not issue book. Please ensure the user is valid and the book is in stock.
        </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/borrow" method="POST">
        <input type="hidden" name="action" value="adminIssue">
        
        <div class="form-group">
            <label>Select Member</label>
            <select name="userId" class="form-control" required>
                <option value="">-- Choose Member --</option>
                <% for(model.User u : us.getAllUsers()) { 
                    if(u.getRole() != null && u.getRole().trim().equalsIgnoreCase("USER")) { %>
                    <option value="<%= u.getId() %>"><%= u.getUsername() %> (ID: <%= u.getId() %>)</option>
                <% } } %>
            </select>
            <small style="color: var(--text-muted);">Only regular members are listed here.</small>
        </div>

        <div class="form-group" style="margin-top: 1.5rem;">
            <label>Select Available Book</label>
            <select name="bookId" class="form-control" required>
                <option value="">-- Choose Book --</option>
                <% for(model.Book b : bks.getAllBooks()) { 
                    if(b.getQuantity() > 0) { %>
                    <option value="<%= b.getId() %>"><%= b.getTitle() %> (<%= b.getBookType() %>)</option>
                <% } } %>
            </select>
            <small style="color: var(--text-muted);">Only books currently in stock are listed.</small>
        </div>

        <div style="margin-top: 2.5rem; display: flex; gap: 1rem;">
            <button type="submit" class="btn btn-primary" style="flex: 2;">Confirm Issuance</button>
            <a href="dashboard.jsp" class="btn btn-outline" style="flex: 1;">Cancel</a>
        </div>
    </form>
</div>

<%@ include file="../footer.jsp" %>
