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
 * Servlet implementation class NewBirthday
 */
@WebServlet(name = "newBirthday", urlPatterns = { "/newBirthday" })
public class NewBirthday extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewBirthday() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String birthday = request.getParameter("birthday");
		int personID = Integer.valueOf(request.getParameter("idPerson"));
		
		String sqlSequence = "INSERT INTO birthday (idPerson, birthday) VALUES (" + personID + ", '" + birthday + "')";
		
		MySqlConnection.runSQL(sqlSequence);
		
		PrintWriter pw = response.getWriter();
		
		pw.append("<script>window.location.replace(\"DataViewsJSP/viewBirthday.jsp\");</script>");
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
