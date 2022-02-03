// Domain layer interface
// Responsibilities: 
public interface IOpportunities extends fflib_ISObjectDomain
{
    void applyDiscount(Decimal discountPercentage, fflib_ISObjectUnitOfWork uow);
}