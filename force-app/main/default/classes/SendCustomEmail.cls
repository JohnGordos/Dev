public class SendCustomEmail{

    public static void SendEmail(List<String> recipients, String[] ccs, String subject, String body){
    
    Messaging.SingleEmailMessage m = new Messaging.SingleEmailMessage();
        m.settoAddresses(recipients);
        m.setCCAddresses(ccs);
        
        m.setsubject(subject);
        m.setHTMLbody(body);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { m });
    }
    
}    

//I had to use https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_email_outbound_single.htm');