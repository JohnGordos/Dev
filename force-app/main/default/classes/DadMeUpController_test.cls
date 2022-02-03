@isTest
public class DadMeUpController_test {

    @isTest static void testconstructor(){
        DadMeUpController controller = new DadMeUpController();
        
        system.AssertNotEquals(null,controller.child);
        system.AssertEquals(Schema.Child__c.getSobjectType(),controller.child.getSobjecttype());
    }
    
    @isTest static void testnewchildstate(){
        DadMeUpController controller = new DadMeUpController();
        controller.newchildstate();
        system.assertEquals('new child',controller.state);
    }
    
    @isTest static void testnewparentstate(){
        DadMeUpController controller = new DadMeUpController();
        controller.parentstate();
        system.assertEquals('parent',controller.state);
    }
    
    @isTest static void testgetsiblingoptions(){
        DadMeUpController controller = new DadMeUpController();
        
        List<SelectOption> testoptions = controller.getsiblingoptions();
        system.assert(controller.MaxSiblings>0);
        system.assertEquals(controller.MaxSiblings + 1,testoptions.size());
        
        for(Integer i=0; i<=controller.MaxSiblings; i++){
            system.assertEquals(string.valueof(i),testoptions[i].getvalue());
        }
        
        system.assertEquals(testoptions[controller.MaxSiblings].getvalue()+'+',testoptions[controller.MaxSiblings].getLabel());
    }
    
    
    @isTest static void testpopulateparents(){
        List<String> carmodels = Util.getpicklists('Child__c','Car_Model__c');
        Child__c testchild = new child__c(Name='Jimmy',
            Are_Video_Games_Allowed__c = true,Car_Model__c=carmodels[0],
            Maximum_Number_of_Siblings__c=5,Minimum_Number_of_Siblings__c=0);
        DadMeUpController controller = new DadMeUpController();
        system.assertEquals(null,controller.message);
        controller.populateparents(testchild);
        system.assertEquals(null,controller.parents);
        system.assertEquals('display inventory',controller.state);
        system.assertNotEquals(null,controller.message);
        
        Parent__c matchingparent1 = new Parent__c(Name='Deb',Are_Video_Games_Allowed__c=true,Car_Model__c=carmodels[0],
                                              Number_of_Current_Children__c=3,Email__c='1@2.com');
        
        Parent__c matchingparent2 = new Parent__c(Name='Frank',Are_Video_Games_Allowed__c=true,Car_Model__c=carmodels[0],
                                              Number_of_Current_Children__c=3,Email__c='2@2.com');
        Parent__c notmatchingparent = new Parent__c(Name='Lucifer',Are_Video_Games_Allowed__c=false,Car_Model__c=carmodels[0],
                                              Number_of_Current_Children__c=3,Email__c='3@2.com');
        insert new Parent__c[]{matchingparent1,matchingparent2,notmatchingparent};
            
        
        controller.populateparents(testchild);
        system.assertEquals('display inventory',controller.state);
        
        system.assertEquals(2,controller.parents.size());
        
    }
    @istest static void testlogin(){
        
        DadMeUpController controller = new DadMeUpController();
        List<String> carmodels = Util.getpicklists('Child__c','Car_Model__c');
        insert new child__c(Name='Jimmy',Email__c='1@1.com',Password__c='abc');
        
        controller.child.Email__c='bademail@test.com';
        controller.child.Password__c='badpassword';
        
        system.AssertEquals(null,controller.message);
        controller.login();
        system.assertEquals(null,controller.child.id);
        system.AssertNotEquals(null,controller.message);
        controller.child.Email__c='1@1.com';
        controller.child.Password__c='abc';
        
        controller.login();
        system.assertNotEquals(null,controller.child.id);
        system.assertEquals('display inventory',controller.state);
    }
}