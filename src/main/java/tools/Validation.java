package tools;

public class Validation 
{
	public static boolean isSourceValid(String source) 
	{
		return source != null && !"null".equals(source) && !source.trim().isEmpty();
	}
}
