@IsTest
public class ParkLocatorTest {
	
    @IsTest public static void byCountryTest(){
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String[] parks = ParkLocator.Country('Germany');
        system.assertEquals(new String[]{'Hamburg Wadden Sea National Park', 'Hainich National Park', 'Bavarian Forest National Park'},
                           parks);
    }
    
}