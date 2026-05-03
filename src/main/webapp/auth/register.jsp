<%@ include file="../header.jsp" %>

<div class="auth-wrapper">
    <div class="card auth-card">
        <h2 style="text-align: center; margin-bottom: 2rem;">Create Account</h2>
        <form action="${pageContext.request.contextPath}/auth" method="POST">
            <input type="hidden" name="action" value="register">
            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" class="form-control" placeholder="Choose a username" required>
            </div>
            <div class="form-group">
                <label>Email Address</label>
                <input type="email" name="email" class="form-control" placeholder="you@example.com" required>
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" class="form-control" placeholder="Create a password" required>
            </div>
            <div class="form-group">
                <label>Membership Type</label>
                <select name="membership" class="form-control">
                    <option value="Student">Student</option>
                    <option value="Faculty">Faculty</option>
                    <option value="General">General</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary" style="width: 100%;">Get Started</button>
        </form>
        <p style="text-align: center; margin-top: 1.5rem; color: var(--text-muted);">
            Already have an account? <a href="login.jsp" style="color: var(--primary); font-weight: 600;">Login</a>
        </p>
    </div>
</div>

<%@ include file="../footer.jsp" %>
