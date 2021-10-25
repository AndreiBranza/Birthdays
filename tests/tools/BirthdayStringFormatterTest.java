package tools;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class BirthdayStringFormatterTest {

	@Test
	void birthdayStringFormatterCorrectInPast() {
		assertEquals("31st December 1979", BirthdayStringFormatter.birthdayStringFormatter("1979-12-31 00:00:00"));
	}
	
	@Test
	void birthdayStringFormatterCorrectInFuture() {
		assertEquals("31st December 2028", BirthdayStringFormatter.birthdayStringFormatter("2028-12-31 00:00:00"));
	}
	
	@Test
	void birthdayStringFormatterIncorrect() {
		assertEquals("31st December 2028", BirthdayStringFormatter.birthdayStringFormatter("00:00:00 2028-12-31"));
	}
	
	@Test
	void birthdayStringFormatterNull() {
		assertEquals("unknown", BirthdayStringFormatter.birthdayStringFormatter(null));
	}
	
	@Test
	void transformMonthToNameCorrect() {
		assertEquals("January", BirthdayStringFormatter.transformMonthToName(1));
	}
	
	@Test
	void transformMonthToNameIncorrectZero() {
		assertEquals("unknown", BirthdayStringFormatter.transformMonthToName(0));
	}
	
	@Test
	void transformMonthToNameIncorrectThirteen() {
		assertEquals("unknown", BirthdayStringFormatter.transformMonthToName(13));
	}
	
	@Test
	void newDayFormatSuffixCorrect() {
		assertEquals("31st", BirthdayStringFormatter.newDayFormatSuffix(31));
	}
	
	@Test
	void newDayFormatSuffixIncorrect() {
		assertEquals("", BirthdayStringFormatter.newDayFormatSuffix(41));
	}
	
	
	

}
