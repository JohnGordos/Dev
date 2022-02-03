public class DailyLeadProcessor implements Schedulable {

    public void execute(SchedulableContext ctx) {
        Lead[] leadstoUpdate = new Lead[0];

        for(Lead l : [SELECT ID, LeadSource FROM LEAD WHERE LeadSource = null LIMIT 200]){
            l.LeadSource = 'Dreamforce';
            leadstoUpdate.add(l);
        }
        
        update leadstoUpdate;
    }

}