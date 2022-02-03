public class ContactAndLeadSearch{

    public static List<List<Sobject>> searchContactsAndLeads(String lastname){
        
        List<List<Sobject>> LeadsandContacts = [Find :lastname IN NAME FIELDS Returning Lead(Name), Contact(FirstName,LastName)];
        
        return LeadsandContacts;
        
    }
}