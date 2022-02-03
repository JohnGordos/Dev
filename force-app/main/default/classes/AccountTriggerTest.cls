@IsTest
public class AccountTriggerTest {
	
    static testmethod void bulkInsert(){
        List<Account> testaccounts = new List<Account>();
        for(integer x = 0; x <200; x++){
            Account act = new Account();
            act.Name = 'Test '+x;
            act.BillingState = 'CA';
            testaccounts.add(act);
        }
        
        insert testaccounts;
        
        for(Account testAct : [SELECT Id, BillingState, ShippingState 
                               FROM Account WHERE Name LIKE 'TEST%']){
            system.assertEquals(testAct.ShippingState, testAct.BillingState);
        }
        
    }
}