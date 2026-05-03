<%@ include file="../header.jsp" %>

<div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
    <h1>Authors</h1>
</div>

<div style="display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 1.5rem;">
    <c:forEach var="author" items="${authors}">
        <div class="card">
            <i class="fas fa-user-edit" style="font-size: 2rem; color: var(--primary); margin-bottom: 1rem;"></i>
            <h3>${author.name}</h3>
            <span style="font-size: 0.75rem; font-weight: 800; color: var(--secondary);">${author.authorType}</span>
            <p style="margin-top: 1rem; font-size: 0.9rem; color: var(--text-muted);">${author.bio}</p>
        </div>
    </c:forEach>
</div>

<%@ include file="../footer.jsp" %>
