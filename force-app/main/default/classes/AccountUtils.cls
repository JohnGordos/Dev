public class AccountUtils {

    public static List<Account> accountsByState(String statecode){
        List<Account> accts = [SELECT ID, Name FROM Account 
                                 WHERE BillingState = :statecode];
        return accts;
        
    }
    
}