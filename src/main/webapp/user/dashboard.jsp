<%@ include file="../header.jsp" %>
<c:if test="${empty sessionScope.user}">
    <% response.sendRedirect("../auth/login.jsp"); %>
</c:if>

<div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
    <h1>Welcome, ${sessionScope.user.username}</h1>
    <a href="profile.jsp" class="btn btn-outline"><i class="fas fa-user-edit"></i> Edit Profile</a>
</div>

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 2rem;">
    <div class="card">
        <h3>My Borrowed Books</h3>
        <p>You currently have items checked out.</p>
        <a href="borrowed.jsp" class="btn btn-primary" style="margin-top: 1rem;">View My Books</a>
    </div>
    <div class="card">
        <h3>Quick Actions</h3>
        <div style="display: flex; flex-direction: column; gap: 0.5rem; margin-top: 1rem;">
            <a href="${pageContext.request.contextPath}/books?action=list" class="btn btn-outline" style="justify-content: flex-start;">
                <i class="fas fa-search"></i> Search New Books
            </a>
            <a href="history.jsp" class="btn btn-outline" style="justify-content: flex-start;">
                <i class="fas fa-history"></i> My Reading History
            </a>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp" %>
