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
 * Servlet implementation class EditAddress
 */
@WebServlet("/EditAddress")
public class EditAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditAddress() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		PrintWriter pw = response.getWriter();
		String addressId = request.getParameter("addressId");	
		String newValueOfAddress = request.getParameter("newAddressValue");
		
		//trebuie sa obtin valorile idurilor de city si county asdafasfa
		
		String addressEditSql = "UPDATE address SET street = '" + newValueOfAddress + "' WHERE id ='" + addressId + "'"	;
		System.out.println(addressEditSql);
	
		boolean successfullAddressEdit = MySqlConnection.runSQL(addressEditSql);
		
		if (successfullAddressEdit)
		{
			pw.append("The address has been updated.");
			pw.append("<br>");
			pw.append("<a href=\"DataViewsJSP/viewAddresses.jsp\">Take me back</a><br>");
			pw.append("<table border = 0, cellpadding = 5>");
		}
		else 
		{
			//catch ()
			pw.append("There has been an error. Please retry.");
			pw.append("<br>");
			pw.append("<a href=\"DataViewsJSP/viewAddresses.jsp\">Take me back</a><br>");
			pw.append("<table border = 0, cellpadding = 5>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
