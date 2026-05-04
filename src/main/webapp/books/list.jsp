<%@ include file="../header.jsp" %>

<div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
    <h1>Library Catalog</h1>
    <c:if test="${sessionScope.user.role == 'ADMIN' && param.view == 'admin'}">
        <a href="books/add.jsp" class="btn btn-primary"><i class="bi bi-plus-lg"></i> Add New Book</a>
    </c:if>
</div>

<form action="${pageContext.request.contextPath}/books" method="GET" style="margin-bottom: 2rem; display: flex; gap: 0.5rem;">
    <input type="hidden" name="action" value="search">
    <input type="text" name="query" class="form-control" placeholder="Search by title, author, or genre...">
    <button type="submit" class="btn btn-primary">Search</button>
</form>

<div class="card" style="padding: 0;">
    <table class="data-table">
        <thead>
            <tr>
                <th>Type</th>
                <th>Title</th>
                <th>Author</th>
                <th>Genre</th>
                <th>ISBN</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="book" items="${books}">
                <tr>
                    <td><span style="font-size: 0.75rem; font-weight: 800; text-transform: uppercase; color: var(--primary);">${book.getBookType()}</span></td>
                    <td><strong>${book.getTitle()}</strong></td>
                    <td>${book.getAuthor()}</td>
                    <td>${book.getGenre()}</td>
                    <td>${book.getIsbn()}</td>
                    <td>
                        <c:choose>
                            <c:when test="${book.getQuantity() > 0}">
                                <span style="color: var(--success); font-weight: 600;">Available (${book.getQuantity()})</span>
                            </c:when>
                            <c:otherwise>
                                <span style="color: var(--danger); font-weight: 600;">Out of Stock</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <div style="display: flex; gap: 0.5rem;">
                            <a href="${pageContext.request.contextPath}/books?action=details&id=${book.getId()}" class="btn btn-outline" style="padding: 0.25rem 0.75rem; font-size: 0.85rem;">Details</a>
                            <c:if test="${sessionScope.user.role == 'ADMIN' && param.view == 'admin'}">
                                <a href="${pageContext.request.contextPath}/books?action=delete&id=${book.getId()}" class="btn btn-danger" style="padding: 0.25rem 0.5rem;" onclick="return confirm('Are you sure?')"><i class="bi bi-trash"></i></a>
                            </c:if>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>
