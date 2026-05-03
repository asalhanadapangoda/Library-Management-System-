<%@ include file="../header.jsp" %>
<%@ page import="service.UserService" %>
<%@ page import="model.User" %>
<%@ page import="model.AdminUser" %>

<c:if test="${sessionScope.user.role != 'ADMIN'}">
    <% response.sendRedirect("../auth/login.jsp"); %>
</c:if>

<%
    String id = request.getParameter("id");
    UserService us = new UserService();
    User admin = us.findById(id);
    if(admin == null || !"ADMIN".equals(admin.getRole())) {
        response.sendRedirect(request.getContextPath() + "/admin/users?action=adminList");
        return;
    }
    request.setAttribute("admin", (AdminUser)admin);
%>

<div class="card" style="max-width: 600px; margin: 0 auto;">
    <h2>Edit Admin Details</h2>
    <p style="color: var(--text-muted); margin-bottom: 2rem;">Update administrative account information for ${admin.username}.</p>

    <form action="${pageContext.request.contextPath}/admin/users" method="POST">
        <input type="hidden" name="action" value="updateAdmin">
        <input type="hidden" name="id" value="${admin.id}">
        
        <div class="form-group">
            <label>Username</label>
            <input type="text" name="username" class="form-control" value="${admin.username}" readonly style="background: #f1f5f9;">
        </div>

        <div class="form-group">
            <label>Email Address</label>
            <input type="email" name="email" class="form-control" value="${admin.email}" required>
        </div>

        <div class="form-group">
            <label>Change Password (leave blank to keep current)</label>
            <input type="password" name="password" class="form-control" placeholder="••••••••">
        </div>

        <div class="form-group">
            <label>Admin Responsibility Level</label>
            <input type="text" name="level" class="form-control" value="${admin.adminLevel}" required>
        </div>

        <div style="margin-top: 2rem; display: flex; gap: 1rem;">
            <button type="submit" class="btn btn-primary" style="flex: 2;">Update Admin</button>
            <a href="${pageContext.request.contextPath}/admin/users?action=adminList" class="btn btn-outline" style="flex: 1;">Cancel</a>
        </div>
    </form>
</div>

<%@ include file="../footer.jsp" %>
