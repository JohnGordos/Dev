@IsTest
public with sharing class DailyLeadProcessorTest {
    
    @testSetup static void createLeadsWithoutSource() {
        List<Lead> testleads = new List<Lead>();
        for(Integer i =0; i < 200; i++){
            Lead l = new Lead();
            l.LastName = 'Test '+i;
            l.Company = 'Daily Lead Processor Test';
            testleads.add(l);
        }
        insert testleads;
    }

    static testmethod void updateLeadsWithoutSource(){
        String CRON_EXP = '0 0 0 26 3 ? 2020';
        List<Lead> leadsBeforeUpdate = [SELECT ID, LeadSource FROM LEAD Where LeadSource = null];
        system.assertEquals(200,leadsBeforeUpdate.size());

        Test.startTest();
        String jobId = System.schedule('ScheduledApexTest', CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();
        
        List<Lead> leadsAfterUpdate = [SELECT ID, LeadSource FROM LEAD Where LeadSource = 'Dreamforce'];
        system.assertEquals(200,leadsAfterUpdate.size());
    }

    static testmethod void updateLeadsWithSource(){
        String CRON_EXP = '0 0 0 26 3 ? 2020';
        List<Lead> leadsUpdatedSource = new List<Lead>();

        for(Lead l :[SELECT ID, LeadSource FROM LEAD Where LeadSource = null]){
            l.LeadSource = 'Nada';
            leadsUpdatedSource.add(l);
        }
        update leadsUpdatedSource;
        List<Lead> leadsWithSource = [SELECT ID, LeadSource FROM LEAD Where LeadSource != null];

        system.assertEquals(200,leadsWithSource.size());

        Test.startTest();
        String jobId = System.schedule('ScheduledApexTest', CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();
        
        List<Lead> leadsAfterSchedule = [SELECT ID, LeadSource FROM LEAD Where LeadSource = 'Dreamforce'];
        system.assertEquals(0,leadsAfterSchedule.size());

    }

}