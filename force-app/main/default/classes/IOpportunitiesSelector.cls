// Selector layer interface
// Responsibilities: 
public interface IOpportunitiesSelector extends fflib_ISObjectSelector
{
    List<Opportunity> selectByIdWithProducts(Set<ID> idSet);
}