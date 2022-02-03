@IsTest
public class AnimalLocatorTest {
    @isTest static void testgetAnimalNameById(){
        Test.setMock(HttpCalloutMock.class,new AnimalLocatorMock());
        String name = AnimalLocator.getAnimalNameById(2);
        system.assertEquals('bear',name); 
       
    }
}