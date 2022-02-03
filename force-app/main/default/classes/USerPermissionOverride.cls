public class USerPermissionOverride{

    Public Account ownerplaceholder {get;set;}
    
    public UserPermissionOverride(){
        ownerplaceholder = new Account();
    }
    /*
    public static Account getownerplaceholder(){
        ownerplaceholder = new Account();
        return ownerplaceholder;
    }
    */
    public void createLead(){
        
        Lead newlead = new Lead();
        newlead.OwnerId = ownerplaceholder.OwnerId;
        newlead.LastName = 'Test';
        newLead.Company = 'Test';
        insert newLead;
    }
    
}