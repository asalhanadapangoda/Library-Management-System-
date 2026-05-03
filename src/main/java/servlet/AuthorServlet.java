package servlet;

import model.Author;
import service.AuthorService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@WebServlet("/authors")
public class AuthorServlet extends HttpServlet {
    private AuthorService authorService = new AuthorService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("list".equals(action)) {
            List<Author> authors = authorService.getAllAuthors();
            request.setAttribute("authors", authors);
            request.getRequestDispatcher("/authors/list.jsp").forward(request, response);
        } else if ("adminList".equals(action)) {
            List<Author> authors = authorService.getAllAuthors();
            request.setAttribute("authors", authors);
            request.getRequestDispatcher("/admin/authors.jsp").forward(request, response);
        } else if ("delete".equals(action)) {
            authorService.deleteAuthor(request.getParameter("id"));
            response.sendRedirect(request.getContextPath() + "/authors?action=adminList");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("add".equals(action)) {
            String name = request.getParameter("name");
            String bio = request.getParameter("bio");
            String books = request.getParameter("books");
            String id = UUID.randomUUID().toString().substring(0, 8);
            
            authorService.addAuthor(new Author(id, name, bio, books));
            response.sendRedirect(request.getContextPath() + "/authors?action=adminList");
        } else if ("update".equals(action)) {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String bio = request.getParameter("bio");
            String books = request.getParameter("books");
            
            authorService.updateAuthor(new Author(id, name, bio, books));
            response.sendRedirect("authors?action=adminList");
        }
    }
}
