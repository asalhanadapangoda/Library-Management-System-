<%@ include file="header.jsp" %>

<div style="text-align: center; padding: 4rem 0;">
    <h1 style="font-size: 3.5rem; font-weight: 800; margin-bottom: 1.5rem; background: linear-gradient(to right, #6366f1, #a855f7); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">
        Unlock Knowledge, Manage Easily.
    </h1>
    <p style="font-size: 1.25rem; color: var(--text-muted); max-width: 700px; margin: 0 auto 2.5rem;">
        The next generation library management system designed for students, faculty, and administrators. Seamlessly borrow, review, and organize your collection.
    </p>
    <div style="display: flex; gap: 1rem; justify-content: center;">
        <a href="books?action=list" class="btn btn-primary" style="font-size: 1.1rem; padding: 1rem 2rem;">
            Explore Collection <i class="fas fa-arrow-right"></i>
        </a>
        <a href="auth/login.jsp" class="btn btn-outline" style="font-size: 1.1rem; padding: 1rem 2rem;">
            Member Login
        </a>
    </div>
</div>

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 2rem; margin-top: 2rem;">
    <div class="card">
        <i class="fas fa-users" style="font-size: 2rem; color: var(--primary); margin-bottom: 1rem;"></i>
        <h3>User Centric</h3>
        <p>Simple registration and profile management. Track your borrowing history with ease.</p>
    </div>
    <div class="card">
        <i class="fas fa-book" style="font-size: 2rem; color: var(--accent); margin-bottom: 1rem;"></i>
        <h3>Diverse Catalog</h3>
        <p>From E-books to Printed copies, find everything in our extensive library catalog.</p>
    </div>
    <div class="card">
        <i class="fas fa-shield-alt" style="font-size: 2rem; color: var(--success); margin-bottom: 1rem;"></i>
        <h3>Admin Power</h3>
        <p>Robust administrative tools for managing users, books, and moderating reviews.</p>
    </div>
</div>

<%@ include file="footer.jsp" %>
