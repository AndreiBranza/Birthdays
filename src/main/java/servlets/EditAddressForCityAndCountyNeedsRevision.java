package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tools.MySqlConnection;

/**
 * Servlet implementation class EditAddress
 */
@WebServlet("/EditAddressNeedsRevision")
public class EditAddressForCityAndCountyNeedsRevision extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditAddressForCityAndCountyNeedsRevision() {
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
		String newValueOfCountyInt = request.getParameter("countyId");
		String newValueOfCityInt = request.getParameter("cityId");
		String newValueOfAddress = request.getParameter("newAddressValue");
		
		String tempCitySql = "SELECT city FROM cities WHERE id = " + newValueOfCityInt;
		String tempCountySql = "SELECT county FROM counties WHERE id = " + newValueOfCountyInt;
		String cityId = "empty";
		String countyId = "empty";
		
		ResultSet rsCity = MySqlConnection.runQuery(tempCitySql);
		
		try {
			rsCity.next();
			cityId = rsCity.getString(1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ResultSet rsCounty = MySqlConnection.runQuery(tempCountySql);
		
		try {
			rsCounty.next();
			countyId = rsCounty.getString(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		//trebuie sa obtin valorile idurilor de city si county
		
		String addressEditSql = "UPDATE address SET street = '" + newValueOfAddress + "' WHERE id ='" + addressId + "'"	;
		System.out.println(addressEditSql);
		String cityEditSql = "UPDATE cities SET city = '" + newValueOfCityInt + "' WHERE id ='" + cityId + "'"	;
		System.out.println(cityEditSql);
		String countyEditSql = "UPDATE counties SET county = '" + newValueOfCountyInt + "' WHERE id ='" + countyId + "'"	;
		System.out.println(countyEditSql);


		
		boolean successfullCityEdit = MySqlConnection.runSQL(cityEditSql);
		boolean successfullCountyEdit = MySqlConnection.runSQL(countyEditSql);
		boolean successfullAddressEdit = MySqlConnection.runSQL(addressEditSql);
		
		if (successfullAddressEdit && successfullCityEdit && successfullCountyEdit)
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
