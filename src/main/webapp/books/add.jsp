<%@ include file="../header.jsp" %>
<c:if test="${sessionScope.user.role != 'ADMIN'}">
    <% response.sendRedirect("../auth/login.jsp"); %>
</c:if>

<div class="card" style="max-width: 700px; margin: 0 auto;">
    <h2>Add New Book</h2>
    <form action="${pageContext.request.contextPath}/books" method="POST">
        <input type="hidden" name="action" value="add">
        
        <div class="form-group">
            <label>Book Type</label>
            <select name="type" id="bookType" class="form-control" onchange="toggleFields()">
                <option value="PRINTED">Printed Book</option>
                <option value="EBOOK">E-Book</option>
            </select>
        </div>

        <div class="form-group">
            <label>Title</label>
            <input type="text" name="title" class="form-control" required>
        </div>

        <div class="form-group">
            <label>Author</label>
            <input type="text" name="author" class="form-control" required>
        </div>

        <div class="form-group">
            <label>Genre</label>
            <input type="text" name="genre" class="form-control" required>
        </div>

        <div class="form-group">
            <label>ISBN</label>
            <input type="text" name="isbn" class="form-control" required>
        </div>

        <div class="form-group">
            <label>Quantity</label>
            <input type="number" name="quantity" class="form-control" min="1" value="1" required>
        </div>

        <!-- Printed Book Specific -->
        <div id="printedFields">
            <div class="form-group">
                <label>Weight (kg)</label>
                <input type="number" step="0.1" name="weight" class="form-control">
            </div>
            <div class="form-group">
                <label>Shelf Location</label>
                <input type="text" name="shelf" class="form-control">
            </div>
        </div>

        <!-- E-Book Specific -->
        <div id="ebookFields" style="display: none;">
            <div class="form-group">
                <label>File Size</label>
                <input type="text" name="fileSize" class="form-control" placeholder="e.g. 5MB">
            </div>
            <div class="form-group">
                <label>Format</label>
                <input type="text" name="format" class="form-control" placeholder="e.g. PDF">
            </div>
        </div>

        <button type="submit" class="btn btn-primary" style="width: 100%; margin-top: 1rem;">Add to Collection</button>
    </form>
</div>

<script>
function toggleFields() {
    const type = document.getElementById('bookType').value;
    document.getElementById('printedFields').style.display = type === 'PRINTED' ? 'block' : 'none';
    document.getElementById('ebookFields').style.display = type === 'EBOOK' ? 'block' : 'none';
}
</script>

<%@ include file="../footer.jsp" %>
