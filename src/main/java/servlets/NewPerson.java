package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tools.MySqlConnection;

/**
 * Servlet implementation class NewPerson
 */
@WebServlet(name = "newPerson", urlPatterns = {"/newPersoane"})
public class NewPerson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewPerson() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String mobileNo = request.getParameter("phoneNumber");
		int addressID = Integer.valueOf(request.getParameter("idAddress"));
		
		String sqlSequence = "INSERT INTO person (firstName, lastName, email, mobileNo, idAddress) VALUES ("
				+ "'" + firstName + "'"
				+ ","
				+ "'" + lastName + "'"
				+ ", '" + email + "', '" + mobileNo + "', " + addressID
				+ ")";
		
		MySqlConnection.runSQL(sqlSequence);
		
		PrintWriter pw = response.getWriter();
		
		pw.append("<script>window.location.replace(\"DataViewsJSP/viewPersoane.jsp\");</script>");
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
