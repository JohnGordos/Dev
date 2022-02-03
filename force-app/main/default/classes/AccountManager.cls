@RestResource(urlMapping='/Accounts/*/contacts')
global class AccountManager{
    @HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        String accountId = request.requestURI.substringBetween('Accounts/','/contacts');
        return [SELECT ID, Name, (SELECT ID, Name FROM Contacts) FROM Account WHERE ID = :accountId];
    }
}
