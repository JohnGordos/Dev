@RestResource(urlMapping='/case/*/close')
global with sharing class CaseCloseResource {
	@HttpPost
    global static void closeCase(String closeReason){
        RestRequest request = RestContext.request;
    	String[] uriParts = request.requestURI.split('/');
        Id caseId = uriParts[2];
        Set<Id> caseIds = new Set<Id>();
        caseIds.add(caseId);
        CaseService.closeCases(caseIds, closeReason);
    }

}