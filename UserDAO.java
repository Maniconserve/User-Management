package usermanagement.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import usermanagement.model.User;

public class UserDAO {
	private String jdbcURL="jdbc:mysql://@localhost:3306/classicmodels";
	private String jdbcUsername = "root";
	private String jdbcPassword = "manideep1234";
	
	private static final String INSERT_USERS_SQL = "INSERT INTO users(name,email,country)VALUES(?,?,?);";
	private static final String SELECT_USER_BY_ID = "SELECT id,name,email,country FROM users WHERE id=?;";
	private static final String Delete_USERS_SQL = "DELETE FROM users WHERE id=?;";
	private static final String UPDATE_USERS_SQL = "UPDATE users SET name=?,email=?,country=? WHERE id=?;";
	
	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");		
			connection = DriverManager.getConnection(jdbcURL,jdbcUsername,jdbcPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return connection;
	}
	public void insertUser(User user) {
		try(Connection connection = getConnection();
				PreparedStatement pst = connection.prepareStatement(INSERT_USERS_SQL);){
			pst.setString(1, user.getName());
			pst.setString(2, user.getEmail());
			pst.setString(3, user.getCountry());
			pst.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public boolean updateUser(User user) {
		boolean rowUpdated = false;
		try(Connection connection = getConnection();
				PreparedStatement pst = connection.prepareStatement(UPDATE_USERS_SQL);){
			pst.setString(1, user.getName());
			pst.setString(2, user.getEmail());
			pst.setString(3, user.getCountry());
			pst.setInt(4, user.getId());
			rowUpdated = pst.executeUpdate() > 0;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return rowUpdated;
	}
	public User selectUser(int id) {
		User user = null;
		try(Connection connection = getConnection();
				PreparedStatement pst = connection.prepareStatement(SELECT_USER_BY_ID);){
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				String name = rs.getString("name");
				String email = rs.getString("email");
				String country = rs.getString("country");
				user  = new User(id,name,email,country);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	public List<User> selectAllUsers() {
		List<User> users = new ArrayList<>();
		try(Connection connection = getConnection();
				PreparedStatement pst = connection.prepareStatement("SELECT * FROM users;");){
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String country = rs.getString("country");
				users.add(new User(id,name,email,country));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return users;
	}
	public boolean deleteUser(int id) {
		boolean rowDeleted=false;
		try(Connection connection = getConnection();
				PreparedStatement pst = connection.prepareStatement(Delete_USERS_SQL);){
			pst.setInt(1, id);
			rowDeleted = pst.executeUpdate() > 0;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return rowDeleted;
	}
}
