package tools;

import java.io.Serializable;
import tools.CancelButton;

public class JavaBean implements Serializable {
	
	private CancelButton cancelButton;
	
	//use the java bean to implement the cancel button object and take as argument the jsp link which 
	//inside the java bean will send it to the cancel button
	
	public JavaBean(String linkToPageForYes, String linkToPageForNo)
	{
		cancelButton = new CancelButton("x", "y");
	
		
	}

}
