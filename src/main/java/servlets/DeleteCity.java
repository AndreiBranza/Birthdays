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
 * Servlet implementation class DeleteCity
 */
@WebServlet("/DeleteCity")
public class DeleteCity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCity() 
    {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		PrintWriter pw = response.getWriter();
		response.getWriter().append("We are deleting: ").append(request.getContextPath());
		//trebuie sa extrag din request elementul necesar pentru a identifica
		//informatia care terbuie stearsa in baza de date
		//valoarea cheii primare a inregistrarii (tuplu) pe care utilizatorul vrea sa o stearga
		String id = request.getParameter("id");
		//System.out.println("Id is:" + id);

		//trebuie sa transmit linia de SQL bazei de date astfel incat sa elimine acel tuplu.
		
		String sql = "DELETE FROM cities WHERE id = " + id;
		
		MySqlConnection.runSQL( sql );
				
		//System.out.println(sql);
		pw.append("<script>window.location.replace(\"DataViewsJSP/viewOrase.jsp\");</script>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
