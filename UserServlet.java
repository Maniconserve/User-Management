package usermanagement.web;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import usermanagement.dao.UserDAO;
import usermanagement.model.User;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
@WebServlet("/")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserDAO userDAO;
    
    public UserServlet() {
    	this.userDAO = new UserDAO();
    }
    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
		
		switch(action) {
		case "/new":
			showNewForm(request,response);
			break;
		case "/insert":
			insertUser(request,response);
			break;
		case "/delete":
			try{
				deleteUser(request,response);
			}catch(Exception e) {
				System.out.println(e);
			}
			break;
		case "/edit":
			try{
				showEditForm(request,response);
			}catch(Exception e) {
				System.out.println(e);
			}
			break;
		case "/update":
            try {
				updateUser(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
            break;
		default:
			listUser(request,response);
			break;
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
	
	private void listUser(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		List<User> listUser = userDAO.selectAllUsers();
		request.setAttribute("listUser", listUser);
		RequestDispatcher dispatcher = request.getRequestDispatcher("user-list.jsp");
		dispatcher.forward(request, response);
	}
	private void showNewForm(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		RequestDispatcher dispatcher = request.getRequestDispatcher("user-form.jsp");
		dispatcher.forward(request, response);
	}
	private void insertUser(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String country = request.getParameter("country");
		User newUser = new User(name,email,country);
		userDAO.insertUser(newUser);
		response.sendRedirect("list");
	}
	
	private void deleteUser(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		int id = Integer.parseInt(request.getParameter("id"));
		userDAO.deleteUser(id);
		response.sendRedirect("list");
	}
	
	private void showEditForm(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		int id = Integer.parseInt(request.getParameter("id"));
		User existingUser = userDAO.selectUser(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("user-form.jsp");
		request.setAttribute("user",existingUser);
		dispatcher.forward(request, response);
	}
	private void updateUser(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException,SQLException, IOException {
		        int id = Integer.parseInt(request.getParameter("id"));
		        String name = request.getParameter("name");
		        String email = request.getParameter("email");
		        String country = request.getParameter("country");

		        User book = new User(id, name, email, country);
		        userDAO.updateUser(book);
		        response.sendRedirect("list");
		    }
}
