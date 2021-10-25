package tools;

import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Statement;

public class MySqlConnection {

	static String protocol = "jdbc:mysql";
	static String ipServerBazaDeDate = "localhost";
	static String servletDbName = "birthdays";
	
	static String userName = "root";
	static String userPasswd = "root";
		
	static String url = protocol + "://" + ipServerBazaDeDate + "/" + servletDbName + "?user=" + userName + "&password=" + userPasswd;
	
	
	static Connection conn;
	static Statement st;
	
	static
	{
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor().newInstance();
			
			createConnection();
			createStatement();
		}
		catch (InstantiationException | IllegalAccessException | IllegalArgumentException | InvocationTargetException
				| NoSuchMethodException | SecurityException | ClassNotFoundException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void createConnection()
	{
		try 
		{
			conn = DriverManager.getConnection(url);
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void createStatement() 
	{

		try 
		{
			st = conn.createStatement();
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static ResultSet runQuery(String sql) 
	{
		ResultSet rs = null;
		
		try  
		{
			rs = st.executeQuery(sql);
		}
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}

	
	public static boolean runSQL(String sql)
	{
		boolean result = false;
		//try (Statement st = createStatement())  //ca sa mearga asta trebuie sa implementeze AutoCloseable
		try
		{
			st.execute(sql);
			
			result = true;
		} 
		
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	public static boolean runSQLWithConstraints(String sql) throws SQLIntegrityConstraintViolationException 
	{
		boolean result = false;
		//try (Statement st = createStatement())  //ca sa mearga asta trebuie sa implementeze AutoCloseable
		try
		{
			st.execute(sql);
			
			result = true;
		} 
		catch (SQLIntegrityConstraintViolationException f)
		{
			throw f;
		}
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
}
