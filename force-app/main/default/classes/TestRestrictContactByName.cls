@IsTest
public class TestRestrictContactByName {

    static testmethod void PreventContactCreation(){
        //would be nice to identify which fields are required via api
        Contact Bad_Name = new Contact();
        Bad_Name.LastName = 'INVALIDNAME';
        Test.starttest();
        Database.SaveResult result = Database.insert(Bad_Name,true);
        test.stoptest();
        system.assertequals(false,result.IsSuccess());
    }
    
    static testmethod void PreventContactUpdate(){
        Contact TestContact = new Contact();
        TestContact.LastName = 'Last';
        Test.starttest();
        Database.SaveResult insertresult = Database.insert(TestContact,true);
        test.stoptest();
        system.assertequals(true,insertresult.IsSuccess());
        
        Contact lastnameupdate = [SELECT Id, LastName FROM Contact WHERE LastName = 'Last'];
        lastnameupdate.lastname = 'INVALIDNAME';
        Test.starttest();
        Database.SaveResult updateresult = Database.update(lastnameupdate,true);
        test.stoptest();
        system.assertequals(false,updateresult.IsSuccess());
    }
    
}