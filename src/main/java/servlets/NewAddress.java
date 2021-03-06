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
 * Servlet implementation class NewAddress
 */
@WebServlet(name = "newAddress", urlPatterns = { "/JSPDataCollectionForms/newAddress" })
public class NewAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewAddress() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String newAddress = request.getParameter("name");
		int idOras = Integer.parseInt(request.getParameter("idCity"));
		
		String sql = "INSERT INTO address (street, idCity) VALUES ('" + newAddress + "', " + idOras + ")";
		
		MySqlConnection.runSQL(sql);
		
		PrintWriter pw = response.getWriter();

		pw.append("<script>window.location.replace(\"../DataViewsJSP/viewAddresses.jsp\");</script>");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
