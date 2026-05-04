<%@ include file="../header.jsp" %>
    <c:if test="${empty sessionScope.user}">
        <% response.sendRedirect("../auth/login.jsp"); %>
    </c:if>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.css">

<div class="user-welcome d-flex justify-content-between align-items-center">
    <div>
        <h1 class="display-6 mb-0">Welcome back, ${sessionScope.user.username}</h1>
        <p class="mb-0 opacity-75">Your personal library assistant is ready.</p>
    </div>
    <a href="profile.jsp" class="btn btn-light text-primary fw-bold"><i class="bi bi-person-gear"></i> Profile Settings</a>
</div>

<div class="row g-4">
    <div class="col-md-6">
        <div class="card h-100">
            <div class="card-body">
                <h3 class="h5 card-title"><i class="bi bi-book-half text-primary me-2"></i> My Borrowed Books</h3>
                <p class="card-text text-muted">View and manage the books you currently have checked out.</p>
                <a href="${pageContext.request.contextPath}/borrow?action=history" class="btn btn-primary">View Active Books</a>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="card h-100">
            <div class="card-body">
                <h3 class="h5 card-title"><i class="bi bi-lightning-charge text-warning me-2"></i> Quick Actions</h3>
                <div class="d-grid gap-2">
                    <a href="${pageContext.request.contextPath}/books?action=list" class="btn btn-outline-primary text-start">
                        <i class="bi bi-search me-2"></i> Discover New Books
                    </a>
                    <a href="${pageContext.request.contextPath}/borrow?action=history" class="btn btn-outline-secondary text-start">
                        <i class="bi bi-clock-history me-2"></i> My Full Reading History
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp" %>