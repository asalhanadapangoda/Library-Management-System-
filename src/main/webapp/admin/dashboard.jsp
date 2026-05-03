<%@ include file="../header.jsp" %>
<c:if test="${sessionScope.user.role != 'ADMIN'}">
    <% response.sendRedirect("../auth/login.jsp"); %>
</c:if>

<div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
    <h1>Admin Control Center</h1>
</div>

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 1.5rem;">
    <a href="${pageContext.request.contextPath}/admin/users?action=list" class="card" style="text-decoration: none; color: inherit; text-align: center;">
        <i class="fas fa-user-shield" style="font-size: 2.5rem; color: var(--primary); margin-bottom: 1rem;"></i>
        <h3>User Management</h3>
        <p>Manage member accounts and permissions</p>
    </a>
    <a href="${pageContext.request.contextPath}/books?action=list" class="card" style="text-decoration: none; color: inherit; text-align: center;">
        <i class="fas fa-book-medical" style="font-size: 2.5rem; color: var(--accent); margin-bottom: 1rem;"></i>
        <h3>Book Inventory</h3>
        <p>Add, edit, or remove books from catalog</p>
    </a>
    <a href="${pageContext.request.contextPath}/borrow?action=list" class="card" style="text-decoration: none; color: inherit; text-align: center;">
        <i class="fas fa-exchange-alt" style="font-size: 2.5rem; color: var(--success); margin-bottom: 1rem;"></i>
        <h3>Borrowing Logs</h3>
        <p>Track transactions and manage returns</p>
    </a>
    <a href="${pageContext.request.contextPath}/authors?action=adminList" class="card" style="text-decoration: none; color: inherit; text-align: center;">
        <i class="fas fa-pen-nib" style="font-size: 2.5rem; color: var(--secondary); margin-bottom: 1rem;"></i>
        <h3>Authors</h3>
        <p>Manage author profiles and bios</p>
    </a>
    <a href="${pageContext.request.contextPath}/reviews?action=moderate" class="card" style="text-decoration: none; color: inherit; text-align: center;">
        <i class="fas fa-star" style="font-size: 2.5rem; color: #facc15; margin-bottom: 1rem;"></i>
        <h3>Moderation</h3>
        <p>Review and moderate user feedback</p>
    </a>
    <a href="${pageContext.request.contextPath}/admin/issue.jsp" class="card" style="text-decoration: none; color: inherit; text-align: center;">
        <i class="fas fa-hand-holding-heart" style="font-size: 2.5rem; color: #f472b6; margin-bottom: 1rem;"></i>
        <h3>Issue Book</h3>
        <p>Give books to members manually</p>
    </a>
    <a href="${pageContext.request.contextPath}/admin/users?action=adminList" class="card" style="text-decoration: none; color: inherit; text-align: center;">
        <i class="fas fa-user-cog" style="font-size: 2.5rem; color: var(--danger); margin-bottom: 1rem;"></i>
        <h3>Admin Team</h3>
        <p>Manage administrative access</p>
    </a>
</div>

<%@ include file="../footer.jsp" %>
