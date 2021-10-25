package view;

import java.util.HashMap;
import model.AddressModel;
import javax.servlet.jsp.JspWriter;

public class AddressViewHtml extends AddressView
{
	//acesta metoda nu stie de unde ia modelul datele si nici nu o intereseaza

	
	@Override
	public void drawSelector(JspWriter out) 
	{
		try
		{
			out.println("<select name=\"idAddress\">");
			HashMap<String, String> addresses = model.AddressModel.loadAddress();
			for(String id : addresses.keySet())
			{
				 out.println("<option value=\"" + id + "\">" + addresses.get(id) + "</option>");
			}
	
	
			 out.println("</select>");	
		}
		catch(Exception ex)
		{
			
		}
		
	}

}
