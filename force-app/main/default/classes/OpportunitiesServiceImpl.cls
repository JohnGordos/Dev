public class OpportunitiesServiceImpl implements IOpportunitiesService
{
    private Opportunity fakeOpp;

    public void applyDiscounts(Set<ID> opportunityIds, Decimal discountPercentage)
    {
        // Create unit of work to capture work and commit it under one transaction
        fflib_ISObjectUnitOfWork uow = Application.UnitOfWork.newInstance();
 
        // Query Opportunities
        List<Opportunity> oppRecords =
            OpportunitiesSelector.newInstance().selectByIdWithProducts(opportunityIds);
                
        // Apply discount via Opportunties domain class behaviour
        //IOpportunities opps = Opportunities.newInstance(oppRecords);
        //opps.applyDiscount(discountPercentage, uow);
 
        // Commit updates to opportunities
        uow.commitWork();
    }

    public Set<Id> createInvoices(Set<ID> opportunityIds, Decimal discountPercentage)
    {
        return new Set<Id>();
    }
 
    public Id submitInvoicingJob()
    {
        return fakeOpp.Id;
    }
}