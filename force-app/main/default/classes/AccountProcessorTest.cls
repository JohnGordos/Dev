@IsTest
public class AccountProcessorTest {
	
    static testMethod void multipleAccountsNoContacts(){
        //Account setup
        Account[] accts = new Account[0];
        for(Integer i=0;i<100;i++){
            Account a = new Account();
            a.Name = 'Test '+i;
            accts.add(a);
        }
        insert accts;
        String[] acctIds = new String[0];
        for(Account acct : [SELECT Id, Name, Number_of_Contacts__c FROM Account WHERE Name Like 'Test%']){
            system.assertEquals(null,acct.Number_of_Contacts__c);
            acctIds.add(acct.Id);
        }
        Test.startTest();
        AccountProcessor.countContacts(acctIds);
        Test.stopTest();
        for(Account acct : [SELECT Id, Name, Number_of_Contacts__c FROM Account WHERE Name Like 'Test%']){
            system.assertEquals(null,acct.Number_of_Contacts__c);
        }
        
    }
    
    static testMethod void multipleAccountsWithContacts(){
        //Account setup
        Account[] accts = new Account[0];
        for(Integer i=0;i<1;i++){
            Account a = new Account();
            a.Name = 'Test '+i;
            accts.add(a);
        }
        insert accts;
        
        //Contact setup
        Contact[] cons = new Contact[0];
        Map<String,Integer> trueContactcount = new Map<String,Integer>();
        String[] acctIds = new String[0];
        
        for(Account acct : [SELECT Id, Name, Number_of_Contacts__c FROM Account WHERE Name Like 'Test%']){
            Integer randomcontactcount = (Integer)(Math.random()*100);
            trueContactcount.put(acct.Id,randomcontactcount);
            acctIds.add(acct.Id);
            system.debug('acct: '+acct.Id+' contact count '+randomcontactcount);
            for(Integer i=0;i<randomcontactcount;i++){
            	Contact c = new Contact();
                c.LastName = 'Test '+i;
                c.AccountId = acct.Id;
                cons.add(c);
            }
            
        }
        insert cons;
        
        for(Account acct : [SELECT Id, Name, Number_of_Contacts__c FROM Account WHERE Name Like 'Test%']){
            system.assertEquals(null,acct.Number_of_Contacts__c);
        }
        Test.startTest();
        AccountProcessor.countContacts(acctIds);
        Test.stopTest();
        
        for(Account acct : [SELECT Id, Name, Number_of_Contacts__c FROM Account WHERE Name Like 'Test%']){
            system.assertEquals(trueContactcount.get(acct.Id),acct.Number_of_Contacts__c);
        }
        
    }
    
    static testMethod void multipleAccountsWithAndWithoutContacts(){
        //Accounts with contacts setup
        Account[] accts = new Account[0];
        for(Integer i=0;i<50;i++){
            Account a = new Account();
            a.Name = 'Test with Contacts'+i;
            accts.add(a);
        }
        insert accts;
        //Contact setup
        Contact[] cons = new Contact[0];
        //The trueContactcount map below is also populated when we iterate over all the inserted accounts
        Map<String,Integer> trueContactcount = new Map<String,Integer>();
        for(Account acct : [SELECT Id, Name, Number_of_Contacts__c FROM Account WHERE Name Like 'Test%']){
            Integer randomcontactcount = (Integer)(Math.random()*100);
            trueContactcount.put(acct.Id,randomcontactcount);
            for(Integer i=0;i<randomcontactcount;i++){
            	Contact c = new Contact();
                c.LastName = 'Test '+i;
                c.AccountId = acct.Id;
                cons.add(c);
            }
        }
        insert cons;
		//Accounts Without Contacts Setup
        Account[] accts2 = new Account[0];
        for(Integer i=0;i<50;i++){
            Account a = new Account();
            a.Name = 'Test With Contacts'+i;
            accts2.add(a);
        }
        insert accts2;
        
        String[] acctIds = new String[0];
        for(Account acct : [SELECT Id, Name, Number_of_Contacts__c FROM Account WHERE Name Like 'Test%']){
            system.assertEquals(null,acct.Number_of_Contacts__c);
            if(trueContactcount.get(acct.Id)==null){
                trueContactcount.put(acct.Id,0);
            }
            acctIds.add(acct.Id);
        }
        
		Test.startTest();
        AccountProcessor.countContacts(acctIds);
        Test.stopTest();
        
        for(Account acct : [SELECT Id, Name, Number_of_Contacts__c FROM Account WHERE Name Like 'Test%']){
            system.assertEquals(trueContactcount.get(acct.Id),acct.Number_of_Contacts__c);
        }
    }
 
}