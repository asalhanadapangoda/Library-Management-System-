<%@ include file="../header.jsp" %>
<c:if test="${sessionScope.user.role != 'ADMIN'}">
    <% response.sendRedirect("../auth/login.jsp"); %>
</c:if>

<div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
    <h1>Administrative Team</h1>
    <button onclick="document.getElementById('addAdminModal').style.display='block'" class="btn btn-primary">Add New Admin</button>
</div>

<div class="card" style="padding: 0;">
    <table class="data-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Admin Name</th>
                <th>Email</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="admin" items="${admins}">
                <tr>
                    <td>${admin.id}</td>
                    <td><strong>${admin.username}</strong></td>
                    <td>${admin.email}</td>
                    <td style="display: flex; gap: 0.5rem;">
                        <a href="${pageContext.request.contextPath}/admin/edit_admin.jsp?id=${admin.id}" class="btn btn-outline" style="padding: 0.25rem 0.5rem;"><i class="bi bi-pencil"></i></a>
                        <c:if test="${admin.id != sessionScope.user.id}">
                            <a href="${pageContext.request.contextPath}/admin/users?action=delete&id=${admin.id}&from=users?action=adminList" class="btn btn-danger" style="padding: 0.25rem 0.5rem;" onclick="return confirm('Remove this admin account?')"><i class="bi bi-person-x"></i></a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<!-- Add Admin Modal -->
<div id="addAdminModal" style="display:none; position:fixed; z-index:1000; left:0; top:0; width:100%; height:100%; background:rgba(0,0,0,0.5);">
    <div class="card" style="max-width:500px; margin: 5% auto;">
        <h3>Register New Administrator</h3>
        <form action="${pageContext.request.contextPath}/admin/users" method="POST">
            <input type="hidden" name="action" value="addAdmin">
            <div class="form-group">
                <label>Admin Username</label>
                <input type="text" name="username" class="form-control" required>
            </div>
            <div class="form-group">
                <label>Email Address</label>
                <input type="email" name="email" class="form-control" required>
            </div>
            <div class="form-group">
                <label>Temporary Password</label>
                <input type="password" name="password" class="form-control" required>
            </div>
            <input type="hidden" name="level" value="Admin">
            <div style="display: flex; gap: 1rem; margin-top: 2rem;">
                <button type="submit" class="btn btn-primary" style="flex: 1;">Create Admin</button>
                <button type="button" onclick="document.getElementById('addAdminModal').style.display='none'" class="btn btn-outline" style="flex: 1;">Cancel</button>
            </div>
        </form>
    </div>
</div>

<%@ include file="../footer.jsp" %>
