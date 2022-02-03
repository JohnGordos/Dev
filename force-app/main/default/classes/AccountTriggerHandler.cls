public class AccountTriggerHandler {
	
    public static void CreateAccounts(List<Account> accts){
        
        for(Account act : accts){
            act.ShippingState = act.BillingState;
        }
        
    }
    
}