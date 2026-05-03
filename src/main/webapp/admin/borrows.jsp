<%@ include file="../header.jsp" %>
<%@ page import="service.BookService" %>
<%@ page import="service.UserService" %>
<% 
    BookService bks = new BookService(); 
    UserService us = new UserService();
%>

<div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
    <h1>Borrowing Transactions Management</h1>
</div>

<div class="card" style="padding: 0;">
    <table class="data-table">
        <thead>
            <tr>
                <th>User</th>
                <th>Book</th>
                <th>Borrowed Date</th>
                <th>Due Date</th>
                <th>Return Date</th>
                <th>Status</th>
                <th>Fine</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="t" items="${transactions}">
                <tr>
                    <td><%= us.findById(((model.Transaction)pageContext.getAttribute("t")).getUserId()).getUsername() %></td>
                    <td><%= bks.findById(((model.Transaction)pageContext.getAttribute("t")).getBookId()).getTitle() %></td>
                    <td>${t.borrowDate}</td>
                    <td>${t.dueDate}</td>
                    <td>${t.returnDate}</td>
                    <td>
                        <span style="padding: 0.25rem 0.5rem; border-radius: 9999px; font-size: 0.75rem; font-weight: 700; background: ${t.status == 'BORROWED' ? '#fef3c7' : '#dcfce7'}; color: ${t.status == 'BORROWED' ? '#92400e' : '#166534'};">
                            ${t.status}
                        </span>
                    </td>
                    <td>$${t.fine}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>
