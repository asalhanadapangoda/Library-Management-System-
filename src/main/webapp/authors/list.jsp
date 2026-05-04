<%@ include file="../header.jsp" %>

    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
        <h1>Authors</h1>
    </div>

    <div class="card" style="padding: 0;">
        <table class="data-table">
            <thead>
                <tr>
                    <th style="width: 25%;">Author Name</th>
                    <th style="width: 30%;">Books Written</th>
                    <th>Biography</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="author" items="${authors}">
                    <tr>
                        <td>
                            <div style="display: flex; align-items: center; gap: 1rem;">
                                <i class="bi bi-person-vcard" style="color: var(--primary);"></i>
                                <strong>${author.name}</strong>
                            </div>
                        </td>
                        <td style="color: var(--secondary); font-size: 0.9rem;">${author.booksWritten}</td>
                        <td style="color: var(--text-muted); font-size: 0.9rem;">${author.bio}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <%@ include file="../footer.jsp" %>