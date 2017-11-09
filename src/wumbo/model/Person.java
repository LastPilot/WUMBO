package wumbo.model;

public class Person {
	String name;
	int cin;
	String email;
	String username;
	String password;
	boolean isAdmin;
	double gpa;

	// for the admin
	public Person(String name, String username, String email, int cin, String password, boolean isAdmin) {
		this.name = name;
		this.username = username;
		this.email = email;
		this.cin = cin;
		this.password = password;
		this.isAdmin = isAdmin;
	}

	// for a student
	public Person(String name, String username, String email, int cin, String password, boolean isAdmin, double gpa) {
		this.name = name;
		this.username = username;
		this.email = email;
		this.cin = cin;
		this.password = password;
		this.isAdmin = isAdmin;
		this.gpa = gpa;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getCin() {
		return cin;
	}

	public void setCin(int cin) {
		this.cin = cin;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isAdmin() {
		return isAdmin;
	}

	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	public double getGpa() {
		return gpa;
	}

	public void setGpa(double gpa) {
		this.gpa = gpa;
	}

}