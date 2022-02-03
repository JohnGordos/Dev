public class AccountHandler {

    public static Account insertNewAccount(String nombre){
        
        Account a = new Account(name = nombre);
        
        try{
            insert a;
            return a;
        }catch (DMLException e) {
            system.debug('Why god why ');
            return null;
        }
        
    }

}