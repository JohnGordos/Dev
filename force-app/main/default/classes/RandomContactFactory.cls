public class RandomContactFactory {
	
    public static Contact[] generateRandomContacts(integer num, String lastname){
        Contact[] returnedcontacts = new Contact[0];
        
        for(Integer x = 0; x < num ; x++){
            Contact testcontact = new Contact();
            testcontact.FirstName = 'Test '+x;
            testcontact.LastName = lastname;
            returnedcontacts.add(testcontact);
        }
        
        return returnedcontacts;
    }
    
}