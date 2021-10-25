package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tools.MySqlConnection;

/**
 * Servlet implementation class DeletePerson
 */
@WebServlet("/DeletePerson")
public class DeletePerson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletePerson() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter pw = response.getWriter();
		//response.getWriter().append("We are deleting: ").append(request.getContextPath());
		String id = request.getParameter("id");
		String status = "200";
		//in acest JSP intampin problema dependentelor intre tabele		
		String deletePerson = "DELETE FROM person WHERE id = " + id;
		String deleteBirthday = "DELETE FROM birthday WHERE idPerson = " + id;
		String getSqlAddressId = "SELECT idAddress FROM birthdays.person WHERE id = " + id;
		String sqlAddress = "DELETE FROM address WHERE id = ";
		int addressId = 0;
		try 
		{
			MySqlConnection.runSQLWithConstraints( deleteBirthday );
			ResultSet addressIdRS = MySqlConnection.runQuery(getSqlAddressId);
			try {
				addressIdRS.next();
				addressId = addressIdRS.getInt("idAddress");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			MySqlConnection.runSQLWithConstraints( sqlAddress + addressId );
			MySqlConnection.runSQLWithConstraints( deletePerson );	

		} 
		catch (SQLIntegrityConstraintViolationException e)
		{
			//trebuie sa ii zic lui view persoane ca este ceva in neregula
			e.printStackTrace();
			status = "300";
		}
		
		//System.out.println(sql);
		pw.append("<script>window.location.replace(\"homePage.jsp?status=" + status + "\")</script>"); //I need to replace the script to redirect to the homepage
		
		//pw.append("<script>document.write(\"<table width=\"\" + dim + \"\"></table>\")</script>");
		//pw.append("<script>window.location.replace(\"DataViewsJSP/viewPersoane.jsp?status=");
		//pw.append(status);
		//pw.append("\")</script>"  );
		
		
		//sa transform textul de langa add new sa fie un pop up cu div-uri in html - vezi in viewPersoane
		//sa continui de facut edit-urile
		//sa ma mai gandesc la o tabela ex telefoane si sa o leg de tabela persoane si sa creez jsp-urile de view si new pentru telefoane
				//de la ZERO !
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
