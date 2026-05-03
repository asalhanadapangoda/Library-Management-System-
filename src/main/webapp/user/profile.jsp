<%@ include file="../header.jsp" %>

<div class="card" style="max-width: 600px; margin: 0 auto;">
    <h2>Update Profile</h2>
    <p style="color: var(--text-muted); margin-bottom: 2rem;">Manage your account details and security.</p>

    <form action="${pageContext.request.contextPath}/auth" method="POST">
        <input type="hidden" name="action" value="update">
        <div class="form-group">
            <label>Username</label>
            <input type="text" name="username" class="form-control" value="${sessionScope.user.username}" readonly style="background: #f1f5f9;">
        </div>
        <div class="form-group">
            <label>Email Address</label>
            <input type="email" name="email" class="form-control" value="${sessionScope.user.email}" required>
        </div>
        <div class="form-group">
            <label>New Password (leave blank to keep current)</label>
            <input type="password" name="password" class="form-control" placeholder="••••••••">
        </div>
        <c:if test="${sessionScope.user.role == 'USER'}">
            <div class="form-group">
                <label>Membership Type</label>
                <select name="membership" class="form-control">
                    <option value="Student" ${sessionScope.user.membershipType == 'Student' ? 'selected' : ''}>Student</option>
                    <option value="Faculty" ${sessionScope.user.membershipType == 'Faculty' ? 'selected' : ''}>Faculty</option>
                    <option value="General" ${sessionScope.user.membershipType == 'General' ? 'selected' : ''}>General</option>
                </select>
            </div>
        </c:if>
        <button type="submit" class="btn btn-primary" style="width: 100%; margin-top: 1rem;">Save Changes</button>
    </form>
</div>

<%@ include file="../footer.jsp" %>
