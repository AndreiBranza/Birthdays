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
 * Servlet implementation class NewCity
 */
@WebServlet(name = "newCity", urlPatterns = { "/newOrase" } )
public class NewCity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewCity() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cityName = request.getParameter("name");
		int idJudet = Integer.parseInt(request.getParameter("idJudet"));
		
		String sql = "INSERT INTO cities (city, idCounty) VALUES ('" + cityName + "', " + idJudet + ")";
		
		MySqlConnection.runSQL(sql);
		
		PrintWriter pw = response.getWriter();

		pw.append("<script>window.location.replace(\"DataViewsJSP/viewOrase.jsp\");</script>");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
