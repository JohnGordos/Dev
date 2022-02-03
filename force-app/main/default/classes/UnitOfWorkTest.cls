@IsTest
public class UnitOfWorkTest {
	
    @IsTest
    private static void challengeComplete(){
        fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(
                                      	new Schema.SObjectType[] {
                                            Account.SObjectType,
                                            Contact.SObjectType,
                                            Task.SObjectType
    									}
		);
        
        for(Integer i =0; i<100; i++){
            Account a = new Account();
            a.Name = 'Test '+i;
            uow.RegisterNew(a);
            for(Integer j=i; j<i+5; j++){
                Contact c = new Contact();
                c.LastName = 'Test '+j;
                uow.RegisterNew(c,Contact.AccountId,a);
                Task t = new Task();
                t.Subject = 'Test '+j;
                uow.RegisterRelationship(t, Task.WhoId, c);
                uow.RegisterNew(t,Task.WhatId,a);
            }
            
        }
        uow.commitWork();
        System.assertEquals(100, [Select Id from Account].size());
        System.assertEquals(500, [Select Id from Contact].size());
        System.assertEquals(500, [Select Id from Task WHERE WhoId != null].size());
    }
    
}