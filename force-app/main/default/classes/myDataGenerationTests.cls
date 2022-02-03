@isTest
private class myDataGenerationTests {
    @testSetup
    static void loadTestDataFromStaticResource(){
        List<sObject> accounts = Test.loadData(Account.SObjectType, 'Mock_Data');
    }
    @isTest
    static void testLoadAccountsFromStaticResource() {
        List<Account> accts = [SELECT ID FROM Account];
        system.assertEquals(15, accts.size(), 'expected 15 accounts');
    }
}