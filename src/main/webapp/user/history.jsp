<%@ include file="../header.jsp" %>
<%@ page import="service.BookService" %>
<% BookService bookService = new BookService(); %>

<h2>My Borrowing History</h2>

<div class="card" style="padding: 0;">
    <table class="data-table">
        <thead>
            <tr>
                <th>Book Title</th>
                <th>Borrowed On</th>
                <th>Due Date</th>
                <th>Return Date</th>
                <th>Status</th>
                <th>Fine</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="t" items="${transactions}">
                <tr>
                    <td><%= bookService.findById(((model.Transaction)pageContext.getAttribute("t")).getBookId()).getTitle() %></td>
                    <td>${t.borrowDate}</td>
                    <td>${t.dueDate}</td>
                    <td>${t.returnDate}</td>
                    <td>
                        <span style="padding: 0.25rem 0.5rem; border-radius: 9999px; font-size: 0.75rem; font-weight: 700; background: ${t.status == 'BORROWED' ? '#fef3c7' : '#dcfce7'}; color: ${t.status == 'BORROWED' ? '#92400e' : '#166534'};">
                            ${t.status}
                        </span>
                    </td>
                    <td>$${t.fine}</td>
                    <td>
                        <c:if test="${t.status == 'BORROWED'}">
                            <form action="${pageContext.request.contextPath}/borrow" method="POST">
                                <input type="hidden" name="action" value="return">
                                <input type="hidden" name="transId" value="${t.id}">
                                <button type="submit" class="btn btn-outline" style="padding: 0.25rem 0.75rem; font-size: 0.85rem;">Return</button>
                            </form>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>
