package servlet;

import model.RegularUser;
import model.User;
import service.UserService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.UUID;

@WebServlet("/auth")
public class AuthServlet extends HttpServlet {
    private UserService userService = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("login".equals(action)) {
            String u = request.getParameter("username");
            String p = request.getParameter("password");
            User user = userService.authenticate(u, p);
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                if ("ADMIN".equals(user.getRole())) {
                    response.sendRedirect("admin/dashboard.jsp");
                } else {
                    response.sendRedirect("user/dashboard.jsp");
                }
            } else {
                request.setAttribute("error", "Invalid username or password");
                request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
            }
        } else if ("register".equals(action)) {
            String u = request.getParameter("username");
            String e = request.getParameter("email");
            String p = request.getParameter("password");
            String m = request.getParameter("membership");
            
            String id = UUID.randomUUID().toString().substring(0, 8);
            RegularUser newUser = new RegularUser(id, u, p, e, m);
            userService.registerUser(newUser);
            response.sendRedirect("auth/login.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("logout".equals(action)) {
            request.getSession().invalidate();
            response.sendRedirect("index.jsp");
        }
    }
}
