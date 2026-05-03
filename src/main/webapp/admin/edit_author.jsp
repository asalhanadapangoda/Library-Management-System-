<%@ include file="../header.jsp" %>
<%@ page import="service.AuthorService" %>
<%@ page import="model.Author" %>

<c:if test="${sessionScope.user.role != 'ADMIN'}">
    <% response.sendRedirect("../auth/login.jsp"); %>
</c:if>

<%
    String id = request.getParameter("id");
    AuthorService as = new AuthorService();
    Author author = as.findById(id);
    if(author == null) {
        response.sendRedirect(request.getContextPath() + "/authors?action=adminList");
        return;
    }
    request.setAttribute("author", author);
%>

<div class="card" style="max-width: 600px; margin: 0 auto;">
    <h2>Edit Author: ${author.name}</h2>
    <form action="${pageContext.request.contextPath}/authors" method="POST">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="${author.id}">
        
        <div class="form-group">
            <label>Full Name</label>
            <input type="text" name="name" class="form-control" value="${author.name}" required>
        </div>

        <div class="form-group">
            <label>Biography</label>
            <textarea name="bio" class="form-control" rows="4" required>${author.bio}</textarea>
        </div>

        <div class="form-group">
            <label>Books Written</label>
            <input type="text" name="books" class="form-control" value="${author.booksWritten}" placeholder="e.g. The Great Gatsby, Tender Is the Night">
        </div>

        <div style="margin-top: 2rem; display: flex; gap: 1rem;">
            <button type="submit" class="btn btn-primary" style="flex: 2;">Update Author</button>
            <a href="${pageContext.request.contextPath}/authors?action=adminList" class="btn btn-outline" style="flex: 1;">Cancel</a>
        </div>
    </form>
</div>

<%@ include file="../footer.jsp" %>
