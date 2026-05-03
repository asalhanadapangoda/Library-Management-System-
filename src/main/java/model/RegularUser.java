package model;

public class RegularUser extends User {
    private String membershipType; // e.g., "Student", "Faculty", "General"

    public RegularUser() {
        super();
        this.setRole("USER");
    }

    public RegularUser(String id, String username, String password, String email, String membershipType) {
        super(id, username, password, email, "USER");
        this.membershipType = membershipType;
    }

    public String getMembershipType() { return membershipType; }
    public void setMembershipType(String membershipType) { this.membershipType = membershipType; }

    @Override
    public String getDashboardInfo() {
        return "Regular User Dashboard - Membership: " + membershipType;
    }

    @Override
    public String toString() {
        return super.toString() + "|" + membershipType;
    }
}
