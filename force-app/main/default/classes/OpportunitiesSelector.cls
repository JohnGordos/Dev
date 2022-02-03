public with sharing class OpportunitiesSelector extends fflib_SObjectSelector implements IOpportunitiesSelector
{
    
    public Schema.SObjectType getSObjectType() {
        return Opportunity.SobjectType;
    }
    
    public List<Opportunity> selectByIdWithProducts(Set<Id> opportunityIds) {
        return [Select Id from Opportunity Where Id IN :opportunityIds]; //intentionally useless b/c I don't care
    }

    public List<Schema.SObjectField> getSObjectFieldList(){
        return new List<Schema.SObjectField>();
    }
    
    public static IOpportunitiesSelector newInstance()
    {
        return (IOpportunitiesSelector) Application.Selector.newInstance(Opportunity.SObjectType);
    }
    
}