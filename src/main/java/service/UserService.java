package service;

import model.AdminUser;
import model.RegularUser;
import model.User;
import java.util.ArrayList;
import java.util.List;

public class UserService {
    private static final String FILE_NAME = "users.txt";

    public void registerUser(User user) {
        List<String> lines = new ArrayList<>();
        lines.add(user.toString());
        FileHandler.writeToFile(FILE_NAME, lines, true);
    }

    public List<User> getAllUsers() {
        List<String> lines = FileHandler.readFromFile(FILE_NAME);
        List<User> users = new ArrayList<>();
        for (String line : lines) {
            String[] parts = line.split("\\|");
            if (parts.length >= 5) {
                if ("ADMIN".equals(parts[4])) {
                    users.add(new AdminUser(parts[0], parts[1], parts[2], parts[3], parts[5]));
                } else {
                    users.add(new RegularUser(parts[0], parts[1], parts[2], parts[3], parts[5]));
                }
            }
        }
        return users;
    }

    public User authenticate(String username, String password) {
        for (User user : getAllUsers()) {
            if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
                return user;
            }
        }
        return null;
    }

    public User findById(String id) {
        for (User user : getAllUsers()) {
            if (user.getId().equals(id)) return user;
        }
        return null;
    }

    public void updateUser(User updatedUser) {
        List<User> users = getAllUsers();
        List<String> lines = new ArrayList<>();
        for (User u : users) {
            if (u.getId().equals(updatedUser.getId())) {
                lines.add(updatedUser.toString());
            } else {
                lines.add(u.toString());
            }
        }
        FileHandler.writeToFile(FILE_NAME, lines, false);
    }

    public void deleteUser(String id) {
        List<User> users = getAllUsers();
        List<String> lines = new ArrayList<>();
        for (User u : users) {
            if (!u.getId().equals(id)) {
                lines.add(u.toString());
            }
        }
        FileHandler.writeToFile(FILE_NAME, lines, false);
    }
}
