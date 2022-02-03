@IsTest
public class AddPrimaryContactTest {
	@TestSetup
    public static void createAccounts(){
        List<Account> accts = new List<Account>();
        
        for(Integer i=0;i<100;i++){
            Account a = new Account();
           	a.Name='Test '+i;
            if(Math.mod(i,2)==1){
                a.BillingState = 'NY';
            }else{
                a.BillingState= 'CA';
            }
            accts.add(a);
        }
        insert accts;
    }
    @isTest
    static void testAddPrimarycontact(){
        String state = 'CA';
        Contact con = new Contact();
        
        AddPrimaryContact addprim = new AddPrimaryContact(con,state);
        Test.startTest();
        System.enqueueJob(addprim);
        Test.stopTest();
        System.assertEquals(50,[SELECT count() FROM Contact WHERE MailingState = :state]);        
    }
}