@isTest
public class LeadProcessorTest{
    @TestSetup
    static void createLeads(){
        List<Lead> leads = new List<Lead>();
        for(Integer i=0;i<200;i++){
            Lead l = new Lead();
            l.LastName='TEST '+i;
            l.Company = 'Nada';
            leads.add(l);
        }
        insert leads;
    }
    @isTest
    static void runLeadProcessorBatch(){
        Test.startTest();
        LeadProcessor LP = new LeadProcessor();
        Id batchid = Database.executeBatch(LP);
        Test.stopTest();
        System.assertEquals(200,[select count() From Lead 
                                                WHERE LeadSource ='Dreamforce']);
    }

}