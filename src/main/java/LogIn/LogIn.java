package LogIn;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LogIn
 */
@WebServlet("/LogIn")
public class LogIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogIn() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		String userName = request.getParameterValues("userName")[0];
		String password = request.getParameterValues("password")[0];
		
		System.out.println(userName + " " + password);
		
		
		//conectare la baza de date
		//select cu user si parola in tabela user  SELECT * FROM users WHERE user=userName
		//practic verifica daca acest user si parola exista
		//adica face authenitifcare
		
		
		PrintWriter pw = response.getWriter();
		pw.append("<table border=1 width=100 height=100>");
		pw.append("<tr>");
		pw.append("<td>");
		pw.append("Trying to authenticate " + userName);
		pw.append("</td>");
		pw.append("</tr>");
		pw.append("</table>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

