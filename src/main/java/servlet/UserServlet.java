package servlet;

import model.User;
import service.UserService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/users")
public class UserServlet extends HttpServlet {
    private UserService userService = new UserService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("list".equals(action)) {
            List<User> users = userService.getAllUsers();
            request.setAttribute("users", users);
            request.getRequestDispatcher("/admin/users.jsp").forward(request, response);
        } else if ("adminList".equals(action)) {
            List<User> all = userService.getAllUsers();
            java.util.List<User> admins = new java.util.ArrayList<>();
            for (User u : all) {
                if ("ADMIN".equals(u.getRole())) admins.add(u);
            }
            request.setAttribute("admins", admins);
            request.getRequestDispatcher("/admin/admins.jsp").forward(request, response);
        } else if ("delete".equals(action)) {
            userService.deleteUser(request.getParameter("id"));
            String redirectTo = request.getParameter("from");
            response.sendRedirect(redirectTo != null ? redirectTo : "users?action=list");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("addAdmin".equals(action)) {
            String u = request.getParameter("username");
            String e = request.getParameter("email");
            String p = request.getParameter("password");
            String level = request.getParameter("level");
            String id = "ADM" + java.util.UUID.randomUUID().toString().substring(0, 5);
            
            model.AdminUser newAdmin = new model.AdminUser(id, u, p, e, level);
            userService.registerUser(newAdmin);
            response.sendRedirect("users?action=adminList");
        } else if ("updateAdmin".equals(action)) {
            String id = request.getParameter("id");
            String e = request.getParameter("email");
            String p = request.getParameter("password");
            String level = request.getParameter("level");
            
            model.User existing = userService.findById(id);
            if (existing instanceof model.AdminUser) {
                model.AdminUser admin = (model.AdminUser) existing;
                admin.setEmail(e);
                admin.setAdminLevel(level);
                if (p != null && !p.trim().isEmpty()) {
                    admin.setPassword(p);
                }
                userService.updateUser(admin);
            }
            response.sendRedirect("users?action=adminList");
        }
    }
}
