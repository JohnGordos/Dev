public class AuthorizeNetTest{

    public static String SendRequest(){
    //Will fiddle with the request variables to test various callouts.
        API_Credential__mdt AuthorizeNetCred = [SELECT Login__c, Key__c FROM API_Credential__mdt WHERE Label = 'Authorize.Net'];

        Http Authorize = new Http();
        HttpRequest req = new HttpRequest();

        req.setEndpoint('https://apitest.authorize.net/xml/v1/request.api');
        req.setMethod('POST');
        req.setBody('{"createTransactionRequest": {"merchantAuthentication": {"name": "3nnV5JB5w4","transactionKey": "8qqH546624vbfGSq"},"refId": "123456","transactionRequest": {"transactionType": "authCaptureTransaction","amount": "5","payment": {"creditCard": {"cardNumber": "5424000000000015","expirationDate": "2020-12","cardCode": "999"}},"billTo": {"firstName": "Ellen","lastName": "Johnson","zip": "44628",},}}}');       
        HttpResponse res = Authorize.send(req);
        return res.getBody();
    }
    
}