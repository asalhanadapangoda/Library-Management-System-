<%@ include file="../header.jsp" %>
<c:if test="${sessionScope.user.role != 'ADMIN'}">
    <% response.sendRedirect("../auth/login.jsp"); %>
</c:if>

<div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
    <h1>Member Management</h1>
</div>

<div class="card" style="padding: 0;">
    <table class="data-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Email</th>
                <th>Role</th>
                <th>Membership / Level</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="u" items="${users}">
                <tr>
                    <td>${u.id}</td>
                    <td><strong>${u.username}</strong></td>
                    <td>${u.email}</td>
                    <td>${u.role}</td>
                    <td>
                        <c:choose>
                            <c:when test="${u.role == 'ADMIN'}">${u.adminLevel}</c:when>
                            <c:otherwise>${u.membershipType}</c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/users?action=delete&id=${u.id}" class="btn btn-danger" style="padding: 0.25rem 0.5rem;"><i class="bi bi-trash"></i></a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>
