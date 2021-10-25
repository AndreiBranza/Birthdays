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
 * Servlet implementation class NewCounty
 */
@WebServlet(name = "newCounty", urlPatterns = { "/newCounty" })
public class NewCounty extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewCounty() 
    {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String judet = request.getParameter( "name" );
		
		String sql = "INSERT INTO counties (county) VALUES ('" +  judet + "')";
		//System.out.println(sql);
		boolean inserted = MySqlConnection.runSQL( sql );
		
		
		PrintWriter pw = response.getWriter();
		if( inserted )
		{
			//pw.append("<b>County " + judet + " has been inserted successfully!!!!</b>");
		}
		else
		{
			//pw.append("<font color=\"red\">A situation prevented the addition of county " + judet + "!!!!</b>");
		}
		pw.append("<script>window.location.replace(\"DataViewsJSP/viewJudete.jsp\");</script>");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
