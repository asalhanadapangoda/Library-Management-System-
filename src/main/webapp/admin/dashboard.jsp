<%@ include file="../header.jsp" %>
<c:if test="${sessionScope.user.role != 'ADMIN'}">
    <% response.sendRedirect("../auth/login.jsp"); %>
</c:if>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">

<div class="admin-header">
    <h1 class="h2">Admin Control Center</h1>
    <p class="text-muted">Welcome back, ${sessionScope.user.username}. Manage your library operations below.</p>
</div>

<div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 g-4">
    <div class="col">
        <a href="${pageContext.request.contextPath}/admin/users?action=list" class="card h-100 text-decoration-none text-center p-4">
            <i class="bi bi-shield-lock admin-card-icon text-primary"></i>
            <h3 class="h5">User Management</h3>
            <p class="text-muted small">Manage member accounts and permissions</p>
        </a>
    </div>
    <div class="col">
        <a href="${pageContext.request.contextPath}/books?action=list&view=admin" class="card h-100 text-decoration-none text-center p-4">
            <i class="bi bi-journal-plus admin-card-icon text-warning"></i>
            <h3 class="h5">Book Inventory</h3>
            <p class="text-muted small">Add, edit, or remove books from catalog</p>
        </a>
    </div>
    <div class="col">
        <a href="${pageContext.request.contextPath}/borrow?action=list" class="card h-100 text-decoration-none text-center p-4">
            <i class="bi bi-arrow-left-right admin-card-icon text-success"></i>
            <h3 class="h5">Borrowing Logs</h3>
            <p class="text-muted small">Track transactions and manage returns</p>
        </a>
    </div>
    <div class="col">
        <a href="${pageContext.request.contextPath}/authors?action=adminList" class="card h-100 text-decoration-none text-center p-4">
            <i class="bi bi-pencil-square admin-card-icon text-secondary"></i>
            <h3 class="h5">Authors</h3>
            <p class="text-muted small">Manage author profiles and bios</p>
        </a>
    </div>
    <div class="col">
        <a href="${pageContext.request.contextPath}/reviews?action=moderate" class="card h-100 text-decoration-none text-center p-4">
            <i class="bi bi-star admin-card-icon" style="color: #facc15;"></i>
            <h3 class="h5">Moderation</h3>
            <p class="text-muted small">Review and moderate user feedback</p>
        </a>
    </div>
    <div class="col">
        <a href="${pageContext.request.contextPath}/admin/issue.jsp" class="card h-100 text-decoration-none text-center p-4">
            <i class="bi bi-hand-thumbs-up admin-card-icon" style="color: #f472b6;"></i>
            <h3 class="h5">Issue Book</h3>
            <p class="text-muted small">Give books to members manually</p>
        </a>
    </div>
    <div class="col">
        <a href="${pageContext.request.contextPath}/admin/users?action=adminList" class="card h-100 text-decoration-none text-center p-4">
            <i class="bi bi-person-gear admin-card-icon text-danger"></i>
            <h3 class="h5">Admin Team</h3>
            <p class="text-muted small">Manage administrative access</p>
        </a>
    </div>
</div>

<%@ include file="../footer.jsp" %>
