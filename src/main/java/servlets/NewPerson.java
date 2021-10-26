package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tools.MySqlConnection;

/**
 * Servlet implementation class NewPerson
 */
@WebServlet(name = "NewPerson", urlPatterns = {"/NewPerson"})
public class NewPerson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewPerson() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String mobileNo = request.getParameter("phoneNumber");
		int addressID = Integer.valueOf(request.getParameter("idAddress"));
		String birthday_yyyy_mm_dd = request.getParameter("birthday_yyyy_mm_dd");
		System.out.println(birthday_yyyy_mm_dd);
		ResultSet idPerson;
		int idPersonInt = 0;
		
		String sqlSequence = "INSERT INTO person (firstName, lastName, email, mobileNo, idAddress) VALUES ('" + firstName + "','" + lastName + "','" + email + "','" + mobileNo + "','" + addressID + "')";
		try {
			MySqlConnection.runSQLWithConstraints(sqlSequence);
		} catch (SQLIntegrityConstraintViolationException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		String sqlIdPerson = "SELECT id FROM birthdays.person WHERE firstName = '" + firstName + "' AND lastName = '" + lastName + "' AND email = '" + email + "' AND mobileNo = '" + mobileNo + "'";
		idPerson = MySqlConnection.runQuery(sqlIdPerson);
		
		try {
			idPerson.next();
			idPersonInt = idPerson.getInt(1);
			System.out.println(idPersonInt);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String sqlSeqForBirthday = "INSERT INTO birthday (idPerson, birthday) VALUES ('" + idPersonInt + "', '" + birthday_yyyy_mm_dd + "')";
		
		try {
			MySqlConnection.runSQLWithConstraints(sqlSeqForBirthday);
		} catch (SQLIntegrityConstraintViolationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

				
		/*
		 * in newPersoane jsp trebuie adaugate campruile pentru data nasterii 		 * https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/date
		 * campul care se va trimite cu data nasterii va trebui formatat

		 * aici, in newperson servlet iau luna, ziua si anul si le stochez intr-o variabila
		 * dupa ce am rulat sql-ul de adaugare persoana in baza de date mai rulez un sql care imi returneaza id-ul persoanei cautand in baza de date elementul care corespunde criteriilor
		 * firstName, lastName, email, mobileNo
		 * rulez un nou sql care imi adauga adresa in baza de date
		 *  
		 */
		
		
		
		PrintWriter pw = response.getWriter();
		
		pw.append("<script>window.location.replace(\"DataViewsJSP/viewPersoane.jsp\");</script>");
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
