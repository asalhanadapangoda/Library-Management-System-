package servlet;

import model.Book;
import model.Transaction;
import model.User;
import service.BookService;
import service.BorrowService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@WebServlet("/borrow")
public class BorrowServlet extends HttpServlet {
    private BorrowService borrowService = new BorrowService();
    private BookService bookService = new BookService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            response.sendRedirect("auth/login.jsp");
            return;
        }

        if ("history".equals(action)) {
            List<Transaction> trans = borrowService.getByUserId(user.getId());
            request.setAttribute("transactions", trans);
            request.getRequestDispatcher("/user/history.jsp").forward(request, response);
        } else if ("list".equals(action) && "ADMIN".equals(user.getRole())) {
            List<Transaction> trans = borrowService.getAllTransactions();
            request.setAttribute("transactions", trans);
            request.getRequestDispatcher("/admin/borrows.jsp").forward(request, response);
        } else if ("borrow".equals(action)) {
            String bookId = request.getParameter("bookId");
            Book book = bookService.findById(bookId);
            
            if (book != null && book.getQuantity() > 0) {
                String id = UUID.randomUUID().toString().substring(0, 8);
                String borrowDate = LocalDate.now().toString();
                String dueDate = LocalDate.now().plusDays(14).toString();
                
                Transaction t = new Transaction(id, user.getId(), bookId, borrowDate, dueDate, "BORROWED");
                borrowService.borrowBook(t);
                
                book.setQuantity(book.getQuantity() - 1);
                bookService.updateBook(book);
                
                response.sendRedirect("borrow?action=history");
            } else {
                response.sendRedirect("books?action=list&error=unavailable");
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("return".equals(action)) {
            String transId = request.getParameter("transId");
            List<Transaction> all = borrowService.getAllTransactions();
            for (Transaction t : all) {
                if (t.getId().equals(transId)) {
                    t.setStatus("RETURNED");
                    t.setReturnDate(LocalDate.now().toString());
                    
                    // Fine calculation (Simple: $1 per day late)
                    LocalDate due = LocalDate.parse(t.getDueDate());
                    LocalDate returned = LocalDate.now();
                    if (returned.isAfter(due)) {
                        long daysLate = returned.toEpochDay() - due.toEpochDay();
                        t.setFine(daysLate * 1.0);
                    }
                    
                    borrowService.updateTransaction(t);
                    
                    // Update book quantity
                    Book book = bookService.findById(t.getBookId());
                    if (book != null) {
                        book.setQuantity(book.getQuantity() + 1);
                        bookService.updateBook(book);
                    }
                    break;
                }
            }
            response.sendRedirect("borrow?action=history");
        } else if ("adminIssue".equals(action)) {
            String userId = request.getParameter("userId");
            String bookId = request.getParameter("bookId");
            
            model.User targetUser = new service.UserService().findById(userId);
            model.Book book = new service.BookService().findById(bookId);
            
            if (targetUser != null && book != null && book.getQuantity() > 0) {
                String id = java.util.UUID.randomUUID().toString().substring(0, 8);
                String borrowDate = java.time.LocalDate.now().toString();
                String dueDate = java.time.LocalDate.now().plusDays(14).toString();
                
                Transaction t = new Transaction(id, userId, bookId, borrowDate, dueDate, "BORROWED");
                borrowService.borrowBook(t);
                
                book.setQuantity(book.getQuantity() - 1);
                new service.BookService().updateBook(book);
                
                response.sendRedirect("borrow?action=list");
            } else {
                response.sendRedirect("borrow?action=list&error=invalid_issue");
            }
        }
    }
}
