package servlet;

import model.Book;
import model.EBook;
import model.PrintedBook;
import service.BookService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@WebServlet("/books")
public class BookServlet extends HttpServlet {
    private BookService bookService = new BookService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("list".equals(action)) {
            List<Book> books = bookService.getAllBooks();
            request.setAttribute("books", books);
            request.getRequestDispatcher("/books/list.jsp").forward(request, response);
        } else if ("details".equals(action)) {
            String id = request.getParameter("id");
            Book book = bookService.findById(id);
            request.setAttribute("book", book);
            request.getRequestDispatcher("/books/details.jsp").forward(request, response);
        } else if ("search".equals(action)) {
            String query = request.getParameter("query");
            List<Book> results = bookService.searchBooks(query);
            request.setAttribute("books", results);
            request.getRequestDispatcher("/books/list.jsp").forward(request, response);
        } else if ("delete".equals(action)) {
            String id = request.getParameter("id");
            bookService.deleteBook(id);
            response.sendRedirect("books?action=list");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            String type = request.getParameter("type");
            String title = request.getParameter("title");
            String author = request.getParameter("author");
            String genre = request.getParameter("genre");
            String isbn = request.getParameter("isbn");
            int qty = Integer.parseInt(request.getParameter("quantity"));
            String id = UUID.randomUUID().toString().substring(0, 8);

            Book book;
            if ("EBOOK".equals(type)) {
                String size = request.getParameter("fileSize");
                String format = request.getParameter("format");
                book = new EBook(id, title, author, genre, isbn, qty, size, format);
            } else {
                double weight = Double.parseDouble(request.getParameter("weight"));
                String shelf = request.getParameter("shelf");
                book = new PrintedBook(id, title, author, genre, isbn, qty, weight, shelf);
            }
            bookService.addBook(book);
            response.sendRedirect("books?action=list");
        } else if ("update".equals(action)) {
            String id = request.getParameter("id");
            String type = request.getParameter("type");
            String title = request.getParameter("title");
            String author = request.getParameter("author");
            String genre = request.getParameter("genre");
            String isbn = request.getParameter("isbn");
            int qty = Integer.parseInt(request.getParameter("quantity"));

            Book book;
            if ("EBOOK".equals(type)) {
                String size = request.getParameter("fileSize");
                String format = request.getParameter("format");
                book = new EBook(id, title, author, genre, isbn, qty, size, format);
            } else {
                double weight = Double.parseDouble(request.getParameter("weight"));
                String shelf = request.getParameter("shelf");
                book = new PrintedBook(id, title, author, genre, isbn, qty, weight, shelf);
            }
            bookService.updateBook(book);
            response.sendRedirect("books?action=details&id=" + id);
        }
    }
}
