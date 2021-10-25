package tools;

public class BirthdayStringFormatter 
{
	
	public static String birthdayStringFormatter (String input) 
	{
		if (input == null)
		{
			return "unknown";
		}
		
		String[] splitBirthdayInput = input.split(" ");
		String[] splitShortBirthdayInput ;
		
		if (input.indexOf(":") > input.indexOf("-")) 
		{
			 splitShortBirthdayInput = splitBirthdayInput[0].split("-");
		}
		
		else 
		{
			splitShortBirthdayInput = splitBirthdayInput[1].split("-");
		}
		
		int year = Integer.valueOf(splitShortBirthdayInput[0]);
		int month = Integer.valueOf(splitShortBirthdayInput[1]);
		int day = Integer.valueOf(splitShortBirthdayInput[2]);
			
		String monthFromInt = transformMonthToName(month);
		
		String dayFromInt = newDayFormatSuffix(day);		
		
		String formattedBirthday = dayFromInt + " " + monthFromInt + " " + year;
		
		return formattedBirthday;
		
	}


	static String newDayFormatSuffix(int day) {
		String dayFromInt = null; //sirul vid (empty string)
		if ((day >= 1 && day <= 10) || (day >= 20 && day <= 31)) {
			switch (day) {
			case 4, 5, 6, 7, 8, 9, 10, 20, 24, 25, 26, 27, 28, 29, 30 : 
				dayFromInt  = day + "th";
				break;
			case 2, 22 : 
				dayFromInt = day + "nd";
				break;
			case 3, 23 : 
				dayFromInt = day + "rd";
				break;
			case 1, 21, 31: 
				dayFromInt = day + "st";
				break;
			
			}
		}
		
		else if (day >= 11 && day <= 19) {
			dayFromInt = day + "th";
		}
		
		else dayFromInt = "";
		
		return dayFromInt;
	}


	public static String transformMonthToName(int value) {
		String monthFromInt = "unknown";
		switch (value) {
		case  1 :
			monthFromInt  = "January";
			break;
		case  2 : 
			monthFromInt = "February";
			break;
		case  3 : 
			monthFromInt = "March";
			break;
		case  4 : 
			monthFromInt = "April";
			break;
		case  5 : 
			monthFromInt = "May";
			break;
		case  6 : 
			monthFromInt = "June";
			break;
		case  7 : 
			monthFromInt = "July";
			break;
		case  8 : 
			monthFromInt = "August";
			break;
		case  9 : 
			monthFromInt = "September";
			break;
		case 10 : 
			monthFromInt = "October";
			break;
		case 11 : 
			monthFromInt = "November";
			break;
		case 12 : 
			monthFromInt = "December";
			break;
		}
		return monthFromInt;
	}
	

	 //this code is for testing purposes
	public static void main(String args[]) 
	{
			String birthday = birthdayStringFormatter("1979-12-31 00:00:00");
			System.out.println(birthday);
	}
}
