<%@ include file="../header.jsp" %>

<div class="auth-wrapper">
    <div class="card auth-card">
        <h2 style="text-align: center; margin-bottom: 2rem;">Sign In</h2>
        <c:if test="${not empty error}">
            <div style="background: #fee2e2; color: #dc2626; padding: 1rem; border-radius: 0.5rem; margin-bottom: 1.5rem;">
                ${error}
            </div>
        </c:if>
        <form action="${pageContext.request.contextPath}/auth" method="POST">
            <input type="hidden" name="action" value="login">
            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" class="form-control" placeholder="Enter username" required>
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" class="form-control" placeholder="Enter password" required>
            </div>
            <button type="submit" class="btn btn-primary" style="width: 100%;">Access Account</button>
        </form>
        <p style="text-align: center; margin-top: 1.5rem; color: var(--text-muted);">
            New here? <a href="register.jsp" style="color: var(--primary); font-weight: 600;">Create account</a>
        </p>
    </div>
</div>

<%@ include file="../footer.jsp" %>
