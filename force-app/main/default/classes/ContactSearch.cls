public class ContactSearch {

    public static List<Contact> searchForContacts(String Last_Name, String Postal_Code){
    
        Contact[] cons = [SELECT ID, Name FROM Contact WHERE LastName = :Last_Name AND MailingPostalCode = :Postal_Code];
        return cons;
    
    }

}