@isTest
public class TestFactory {
    
    public static List<Opportunity> generateOppsForAccount(ID accountID, Decimal amount, Integer numToCreate){
        String stageValue = TestFactory.retrieveStageNamePicklistValues();
        List<Opportunity> result = new List<Opportunity>();
        for(Integer i = 0; i < numToCreate; i++){
            Opportunity newOpp = new Opportunity(
                Name = 'TEST '+i,
                StageName = stageValue,
                CloseDate = Date.today(),
                AccountID = accountID,
                Amount = amount
            );
            result.add(newOpp);
        }
        return result;
    }

    private static String retrieveSTageNamePicklistValues(){
        return Opportunity.getSObjectType().getDescribe().fields.getMap().get('StageName').getDescribe().getPickListValues()[0].getValue();
    }
}