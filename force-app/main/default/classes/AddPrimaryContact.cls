public class AddPrimaryContact implements Queueable {
	private Contact con;
    private String stateAbv;
    public AddPrimaryContact(Contact cont, String statecode){
        this.con = cont;
        this.stateAbv = statecode;
    }
    
    public void execute(QueueableContext context){
        List<Contact> insertedcontacts = new List<Contact>();
        for(Account a :[SELECT ID, BillingState FROM Account WHERE BillingState = :StateAbv]){
            Contact con2 = con.Clone();
            con2.AccountId = a.Id;
            con2.LastName = 'TEST';
            con2.MailingState = stateAbv;
            insertedcontacts.add(con2);
        }
        insert insertedcontacts;
    }
}