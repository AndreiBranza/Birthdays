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
 * Servlet implementation class EditCity
 */
@WebServlet("/EditCity")
public class EditCity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCity() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		/*
		 * aic trebuie sa preiau de la editCity jsp informatiile precum id-ul orasului care trebuie editat
		 * si noua valoare a acestuia
		 * dupa care trebuie sa trimit noua valoare bazei de date sa o schimbe
		 * in cazul in care nu sunt erori sa dau mesaj pozitiv si sa pun butonul de revenire la
		 * pagina anterioara care sa ma redirectioneze catre viewOrase.jsp
		 * 
		 */
		PrintWriter pw = response.getWriter();
		String id = request.getParameter("id");
		String newValueOfCity = request.getParameter("newCityValue");
		
		String sql = "UPDATE birthdays.cities SET city = '" + newValueOfCity + "' WHERE id ='" + id + "'"	;
		
		boolean successfull = MySqlConnection.runSQL(sql);
		
		if (successfull)
		{
			pw.append("The city has been updated.");
			pw.append("<br>");
			pw.append("<a href=\"DataViewsJSP/viewCities.jsp\">Take me back</a><br>");
			pw.append("<table border = 0, cellpadding = 5>");
		}
		else 
		{
			//catch ()
			pw.append("There has been an error. Please retry.");
			pw.append("<br>");
			pw.append("<a href=\"DataViewsJSP/viewCities.jsp\">Take me back</a><br>");
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
