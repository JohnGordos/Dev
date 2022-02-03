public class MyContactListController{

    @AuraEnabled
    public static List<Contact> getContacts(Id acctId){

        return [SELECT ID, FirstName, LastName, Email, Phone FROM Contact WHERE AccountId = :acctId];
        
    }

}