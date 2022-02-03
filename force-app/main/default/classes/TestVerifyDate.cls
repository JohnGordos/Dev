@IsTest	
public class TestVerifyDate {
	
    static testMethod void Date1GreaterThanDate2(){
        Date date1 = date.newinstance(2018,06,1);
        Date date2 = date.newinstance(1991,03,26);
        Date returnedDate = VerifyDate.CheckDates(date1,date2);
        
        Date date1EndOfMonth = Date.newInstance(date1.year(),date1.month(),Date.daysinMonth(date1.year(),date1.month()));
        
        System.assertEquals(date1EndOfMonth,returneddate);
        
    }
    
    static testMethod void Date1EqualToDate2(){
        Date date1 = date.newinstance(2018,06,1);
        Date date2 = date1;
        Date date1EndOfMonth = Date.newInstance(date1.year(),date1.month(),Date.daysinMonth(date1.year(),date1.month()));
        Date returnedDate = VerifyDate.CheckDates(date1,date2);
        
        System.assertEquals(date1EndOfMonth,returneddate);
    }
    
    static testMethod void Date1LessThanDate2(){
		Date date2 = date.newinstance(2018,06,1);
        Date date1 = date.newinstance(1991,03,26);
        
        Date returnedDate = VerifyDate.CheckDates(date1,date2);
        
        System.assertEquals(date2,returneddate);
    }
    
}