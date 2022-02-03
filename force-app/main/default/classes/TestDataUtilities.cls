public with sharing class TestDataUtilities {
    public TestDataUtilities() {

    }

    public Account testAccount(String name)
    {
        Account result = new Account();
        result.Name = name;

        return result;
    }
}