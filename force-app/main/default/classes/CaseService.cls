global class CaseService {
	
    global static void closeCases(Set<Id> caseIds, String closeReason){
        List<Case> casesToUpdate = new List<Case>();
        for(Id caseId : caseIds){
            Case c = new Case(id=caseId);
            c.Status = 'Closed';
            c.Reason = closeReason;
            casesToUpdate.add(c);
        }
        update casesToUpdate;
    }
}