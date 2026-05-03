<%@ include file="../header.jsp" %>
<c:if test="${sessionScope.user.role != 'ADMIN'}">
    <% response.sendRedirect("../auth/login.jsp"); %>
</c:if>

<div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
    <h1>Author Management</h1>
    <button onclick="document.getElementById('addAuthorModal').style.display='block'" class="btn btn-primary">Add New Author</button>
</div>

<div class="card" style="padding: 0;">
    <table class="data-table">
        <thead>
            <tr>
                <th>Name</th>
                <th>Bio</th>
                <th>Books Written</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="author" items="${authors}">
                <tr>
                    <td><strong>${author.name}</strong></td>
                    <td>${author.bio}</td>
                    <td>${author.booksWritten}</td>
                    <td>
                        <div style="display: flex; gap: 0.5rem;">
                            <a href="${pageContext.request.contextPath}/admin/edit_author.jsp?id=${author.id}" class="btn btn-outline" style="padding: 0.25rem 0.5rem;"><i class="fas fa-edit"></i></a>
                            <a href="${pageContext.request.contextPath}/authors?action=delete&id=${author.id}" class="btn btn-danger" style="padding: 0.25rem 0.5rem;" onclick="return confirm('Delete this author?')"><i class="fas fa-trash"></i></a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<div id="addAuthorModal" style="display:none; position:fixed; z-index:1000; left:0; top:0; width:100%; height:100%; background:rgba(0,0,0,0.5);">
    <div class="card" style="max-width:500px; margin: 10% auto;">
        <h3>Add Author</h3>
        <form action="${pageContext.request.contextPath}/authors" method="POST">
            <input type="hidden" name="action" value="add">
            <div class="form-group">
                <label>Name</label>
                <input type="text" name="name" class="form-control" required>
            </div>
            <div class="form-group">
                <label>Biography</label>
                <textarea name="bio" class="form-control" placeholder="Short bio about the author..."></textarea>
            </div>
            <div class="form-group">
                <label>Books Written</label>
                <input type="text" name="books" class="form-control" placeholder="e.g. The Great Gatsby, Tender Is the Night">
            </div>
            <div style="display: flex; gap: 1rem;">
                <button type="submit" class="btn btn-primary" style="flex: 1;">Save</button>
                <button type="button" onclick="document.getElementById('addAuthorModal').style.display='none'" class="btn btn-outline" style="flex: 1;">Cancel</button>
            </div>
        </form>
    </div>
</div>

<%@ include file="../footer.jsp" %>
