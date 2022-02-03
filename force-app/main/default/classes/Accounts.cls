public class Accounts extends fflib_SObjectDomain {
    public Accounts(List<Account> sObjectList) {
        super(sObjectList);
    }
    public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new Accounts(sObjectList);
        }
    }
    
    public override void onApplyDefaults() {
    	for(Account acct : (List<Account>) Records) {
    		acct.Description = 'Domain classes rock!';
    	}
    }
        
    public override void onBeforeUpdate(Map<Id,SObject> existingRecords) {
    	final String DOMAIN = 'Domain classes rock!';
        String acctDescription;
        for(Account acct : (List<Account>) Records) {
            acctDescription = acct.Description;
        	acct.AnnualRevenue = acctDescription.getLevenshteinDistance(DOMAIN);
        }
    }  
}