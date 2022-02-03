public class AccountProcessor {
@future
    public static void countContacts(String[] accountIds){
        Account[] accountsToUpdate = new Account[0];
		String[] acctsNoContacts = accountIds.clone();
        for(AggregateResult ar : [SELECT Count(Id) contactcount, accountId FROM Contact WHERE AccountId IN :accountIds Group By AccountId]){
    		acctsNoContacts.remove(acctsNoContacts.indexOf((String)ar.get('accountId')));
			
            system.debug('Account Id '+ar.get('accountId'));
            Account a = new Account(id = (String)ar.get('accountId'));
            system.debug('Contact count '+(Integer)ar.get('contactcount'));
            a.Number_of_Contacts__c = (Integer)ar.get('contactcount');
            accountsToUpdate.add(a);
		}
        system.debug('Accounts without contacts '+acctsNoContacts);
        for(String acctId : acctsNoContacts){
            Account a = new Account(Id = acctId);
            a.Number_of_Contacts__c = 0;
            accountsToUpdate.add(a);
        }
        update accountsToUpdate;
        
    }
}