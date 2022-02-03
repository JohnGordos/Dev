public class CreditCardProcessorController{
    
    //Need to capture inputs for CC transaction
    //Define Method to form JSON body
    //Call Authorize.Net and post body
    public String FullName {get;set;}
    public String FirstName;
    public String LastName;
    public String buyerId {get; set;}
    public String CCNumber {get;set;}
    public String ExpMonth {get;set;}
    public String ExpYear {get;set;}
    public String CCV {get;set;}
    public String ZIP {get;set;}
    public String Email {get;set;}
    public Double amount {get;set;}
    public Map<String,Double> purchaseandamount {get;set;}
    
    public CreditCardProcessorController(){
        
    }
    
    public void SendTransactionInfo(){
        
        String[] names = ParsePurchaserName();
        
    }
    
    public List<String> ParsePurchaserName(){
        String[] firstlastname = new String[0];
        system.debug(FullName);
        Integer FirstSpacePlace = FullName.indexof(' ');
        system.debug('-----'+FirstSpacePlace);
        String FirstName = FullName.left(FirstSpacePlace);
        firstlastname.add(FirstName);
        system.debug('-----'+FirstName);
        String LastName = FullName.right(FullName.length() - FirstSpacePlace - 1);
        firstlastname.add(LastName);
        system.debug('-----'+LastName);
        
        return firstlastname;
    }
    
    public String GenerateJSON(){
        API_Credential__mdt cred = [SELECT Key__c, Login__c FROM API_Credential__mdt WHERE Label = 'Authorize.Net'];
                
        String login = cred.Login__c;
        String key = cred.Key__c;
        
        JSONGenerator JBody = Json.createGenerator(true);
        Jbody.writeStartObject();
            Jbody.writeFieldName('createTransactionRequest');
                JBody.writeStartObject();
                    JBody.writeFieldName('merchantAuthentication');
                        JBody.writeStartObject();
                            JBody.writeStringField('name',login);
                            JBody.writeStringField('transactionKey',key);
                        JBody.writeEndObject();
                        JBody.writeStringField('refId',buyerId);
                        JBody.writeFieldName('transactionRequest');
                            JBody.writeStartObject();
                            JBody.writeStringField('transactionType','authCaptureTransaction');
                            JBody.writeStringField('amount','0');
                            JBody.writeFieldName('payment');
                                JBody.writeStartObject();
                                JBody.writeStringField('cardNumber', CCNumber);
                                JBody.writeStringField('expirationDate','2020-12');
                                JBody.writeStringField('cardCode',CCV);
                                JBody.writeEndObject();
                            JBody.writeEndObject();
                JBody.writeEndObject();
                JBody.writeFieldName('billTo');
                JBody.writeStartObject();
                    JBody.writeStringField('firstName', FirstName);
                    JBody.writeStringField('lastName',LastName);
                    JBody.writeStringField('zip',ZIP);
                Jbody.writeEndObject();                    
        Jbody.writeEndObject();

     return Jbody.getasString();
    }
    /* Minimum Transaction Info
    {
    "createTransactionRequest": {
        "merchantAuthentication": {
            "name": "3nnV5JB5w4", <query
            "transactionKey": "8qqH546624vbfGSq" <query
        },
        "refId": "123456", <The child Id
        "transactionRequest": {
            "transactionType": "authCaptureTransaction",
            "amount": "5", <The amount From the Parent
            "payment": {
                "creditCard": {
                    "cardNumber": "5424000000000015", <input
                    "expirationDate": "2020-12", <input
                    "cardCode": "999" <input
                }
            },
            "billTo": {
                "firstName": "Ellen", <input
                "lastName": "Johnson", <input
                "zip": "44628", <input
            },
        }
    }
}
    
    */
}