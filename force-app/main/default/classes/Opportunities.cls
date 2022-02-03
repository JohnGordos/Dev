public class Opportunities extends fflib_SObjectDomain implements IOpportunities {
    
    public Opportunities(){
        super(new List<Opportunity>());
    }

    public void applyDiscount(Decimal discountPercentage, fflib_ISObjectUnitOfWork uow){
        //UOW pulls opps and applies discount?
    }
}