package usermanagement.model;
/*This is a comment*/
public class User {
	private int id;
	private String name;
	private String email;
	private String country;
	public User(int id2, String name2, String email2, String country2) {
		id = id2;
		name = name2;
		email = email2;
		country = country2;
	}
	public User(String name2, String email2, String country2) {
		name = name2;
		email = email2;
		country = country2;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
}
