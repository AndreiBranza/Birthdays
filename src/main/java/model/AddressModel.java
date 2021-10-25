package model;

import java.sql.ResultSet;
import java.util.HashMap;

import tools.MySqlConnection;

public class AddressModel 
{
	public static HashMap<String,String> loadAddress()
	{
	
		HashMap<String,String> addresses = new HashMap<>();
		
		String tableName = "address";
		String sql = "SELECT * FROM " + tableName;
		 
		ResultSet rs = MySqlConnection.runQuery(sql);
		
		try
		{
			
			while (rs.next())
			{
				addresses.put( "" + rs.getInt("id"), rs.getString("street"));
			
			}
		}
		catch(Exception ex)
		{
			System.out.println("Can not construct the list of addresses " + ex);
		}
		return addresses;
	}
}
