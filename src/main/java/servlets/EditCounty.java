package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tools.MySqlConnection;
import tools.Validation;

/**
 * Servlet implementation class editCounty
 */
@WebServlet("/EditCounty")
public class EditCounty extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCounty() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter pw = response.getWriter();
		String newCountyValue = request.getParameter("newStringValue");
		String idOfCountyToBeUpdated = request.getParameter("idValue");
		String source = request.getParameter("source");
		
		//System.out.println("The id is: " + idOfCountyToBeUpdated);
		
		String sql = "UPDATE birthdays.counties SET county = '" + newCountyValue + "' WHERE id = " 
						+ Integer.valueOf(idOfCountyToBeUpdated) ;
		boolean successfull = MySqlConnection.runSQL(sql);
		if (successfull) 
		{
			pw.append("The county has been updated.");
		}
		else 
		{

			pw.append("There has been an error. Please retry.");
		}
		
		pw.append("<br>");
		if( Validation.isSourceValid(source) )
		{
			pw.append("<a href=\"" + source + "\">Take me back</a><br>");
		}
		else
		{
			pw.append("<a href=\"DataViewsJSP/viewCounties.jsp\">Take me back</a><br>");
		}
		
		pw.append("<table border = 0, cellpadding = 5>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
