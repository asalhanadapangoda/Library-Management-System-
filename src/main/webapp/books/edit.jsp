<%@ include file="../header.jsp" %>
<%@ page import="service.BookService" %>
<%@ page import="model.Book" %>
<%@ page import="model.EBook" %>
<%@ page import="model.PrintedBook" %>

<c:if test="${sessionScope.user.role != 'ADMIN'}">
    <% response.sendRedirect("../auth/login.jsp"); %>
</c:if>

<%
    String id = request.getParameter("id");
    BookService bs = new BookService();
    Book book = bs.findById(id);
    if(book == null) {
        response.sendRedirect("list.jsp");
        return;
    }
    request.setAttribute("book", book);
%>

<div class="card" style="max-width: 700px; margin: 0 auto;">
    <h2>Edit Book: ${book.title}</h2>
    <form action="${pageContext.request.contextPath}/books" method="POST">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="${book.id}">
        
        <div class="form-group">
            <label>Book Type</label>
            <input type="text" class="form-control" value="${book.getBookType()}" readonly style="background: #f1f5f9;">
            <input type="hidden" name="type" value="${book.getBookType() == 'E-Book' ? 'EBOOK' : 'PRINTED'}">
        </div>

        <div class="form-group">
            <label>Title</label>
            <input type="text" name="title" class="form-control" value="${book.title}" required>
        </div>

        <div class="form-group">
            <label>Author</label>
            <input type="text" name="author" class="form-control" value="${book.author}" required>
        </div>

        <div class="form-group">
            <label>Genre</label>
            <input type="text" name="genre" class="form-control" value="${book.genre}" required>
        </div>

        <div class="form-group">
            <label>ISBN</label>
            <input type="text" name="isbn" class="form-control" value="${book.isbn}" required>
        </div>

        <div class="form-group">
            <label>Quantity</label>
            <input type="number" name="quantity" class="form-control" min="0" value="${book.quantity}" required>
        </div>

        <c:choose>
            <c:when test="${book.getBookType() == 'Printed Book'}">
                <div class="form-group">
                    <label>Weight (kg)</label>
                    <input type="number" step="0.1" name="weight" class="form-control" value="<%= ((PrintedBook)book).getWeight() %>">
                </div>
                <div class="form-group">
                    <label>Shelf Location</label>
                    <input type="text" name="shelf" class="form-control" value="<%= ((PrintedBook)book).getShelfLocation() %>">
                </div>
            </c:when>
            <c:otherwise>
                <div class="form-group">
                    <label>File Size</label>
                    <input type="text" name="fileSize" class="form-control" value="<%= ((EBook)book).getFileSize() %>">
                </div>
                <div class="form-group">
                    <label>Format</label>
                    <input type="text" name="format" class="form-control" value="<%= ((EBook)book).getFormat() %>">
                </div>
            </c:otherwise>
        </c:choose>

        <button type="submit" class="btn btn-primary" style="width: 100%; margin-top: 1rem;">Update Book Information</button>
    </form>
</div>

<%@ include file="../footer.jsp" %>
