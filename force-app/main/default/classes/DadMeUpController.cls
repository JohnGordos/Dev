public class DadMeUpController {
    
    public Integer MaxSiblings = 5;
    public String message {get;private set;}
    public String state  {get;private set;}
    public Child__c child {get;set;}
    public Id selectedId {get;set;}
    public Parent__c parent {get;set;}
    public Parent__c[] parents {get;private set;}
    
    public DadMeUpController(){
        child = new Child__c();
        child.Email__c='john.gordos@outlook.com';
        child.Password__c='abc';
    }
    
    public void newchildstate(){
        state = 'new child';
        //child = new Child__c();
    }
    
    public void parentstate(){
        state = 'parent';
        parent = new Parent__c();
    }
    
    public List<SelectOption> getsiblingoptions(){
        SelectOption[] options = new SelectOption[]{};
            for(integer i=0; i<=MaxSiblings; i++){
                options.add(new SelectOption(string.valueof(i),string.valueof(i)));
            }
        return changelastvalue(options);
    }
    
    public SelectOption[] changelastvalue(SelectOption[] ops){
        SelectOption temp = ops[ops.size()-1];
        temp.setLabel(temp.getLabel() + '+');
        return ops;
    }   
    
    public void pickparent(){
        
        if(child.Transaction__c != null){
            associateparent();
        }else{
            state = 'Enter Transaction Info';    
            message='Please enter your payment information in the right-hand side.';
            
        }
    }
    
    public void associateparent(){
        child.Parent__c = selectedId;
        update child;
    }
    
    public void populateparents(){
        populateparents(child);
    }
    
    public void populateparents(Child__c thechild){
        parents = [SELECT Id, Name, Car_Model__c, Are_Video_Games_Allowed__c, Number_of_Current_Children__c, Amount__c FROM Parent__c 
                       WHERE Car_Model__c = :thechild.Car_Model__c 
                       AND Are_Video_Games_Allowed__c = :thechild.Are_Video_Games_Allowed__c 
                       AND Number_of_Current_Children__c >= :thechild.Minimum_Number_of_Siblings__c AND Number_of_Current_Children__c <= :thechild.Maximum_Number_of_Siblings__c];
                       
            state = 'display inventory';    

            system.debug('This is a list of the matching parents: '+parents);
            if(parents.size() == 0){
                message = ' Unforunately, no parents match the criteria you entered. You will remain a ward of the state.';
            }
            system.debug('Matching Parents: '+parents);
    }

    public void login(){
         
       List<Child__c> children = [SELECT Name, Email__c, Password__c, Car_Model__c, Parent__c, Maximum_Number_of_Siblings__c, Transaction__c, Minimum_Number_of_Siblings__c, Are_Video_Games_Allowed__c FROM 
                    Child__c WHERE Email__c = :child.Email__c AND Password__c = :child.Password__c];
                
        if(children.size() > 0){
            child = children[0];
            populateparents(child);
            
        }else{

            message = ' We could not find your credentials in the system. Please double check what you entered.';
        }
    }
    
    public void save(){
        if(state == 'new child' || state == 'display inventory'){
            upsert child;
            //insert child;
            populateparents(child);
            message='Your information has been successfully saved.';
        }else if(state == 'parent'){
            insert parent;
            message='Your information has been successfully saved.';
        }
    }
    
}