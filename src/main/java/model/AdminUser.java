package model;

public class AdminUser extends User {
    private String adminLevel; // e.g., "SuperAdmin", "Editor"

    public AdminUser() {
        super();
        this.setRole("ADMIN");
    }

    public AdminUser(String id, String username, String password, String email, String adminLevel) {
        super(id, username, password, email, "ADMIN");
        this.adminLevel = adminLevel;
    }

    public String getAdminLevel() { return adminLevel; }
    public void setAdminLevel(String adminLevel) { this.adminLevel = adminLevel; }

    @Override
    public String getDashboardInfo() {
        return "Admin Control Panel - Level: " + adminLevel;
    }

    @Override
    public String toString() {
        return super.toString() + "|" + adminLevel;
    }
}
