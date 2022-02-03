@isTest
private class AccountManagerTest {
    @isTest
    private static void testTheGet(){
        List<Account> testAccounts = new List<Account>{new Account(Name = 'Blah Boi')};
        insert testAccounts;
        List<Contact> testContacts = new List<Contact>();
        for(Integer i = 0; i < 10; i++){
            testContacts.add(new Contact(LastName='Test '+i, AccountId = testAccounts[0].Id));
        }
        insert testContacts;
        Test.startTest();
        Account resultAccount = AccountManager.getAccount();
        Test.stopTest();
        System.assertEquals(testAccounts[0].Id, resultAccount.Id);
        System.assertEquals('Blah Boi', resultAccount.Name);
        System.assertEquals(10, resultAccount.Contacts.size());
        for(Contact resultContact : resultAccount.Contacts){
            System.assert(resultContact.Name.contains('Test '));
        }
    }
}
