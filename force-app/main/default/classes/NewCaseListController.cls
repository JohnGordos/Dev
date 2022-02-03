public class NewCaseListController{
    
    public List<Case> getNewCases(){
        Case[] NewCases = [SELECT ID, CaseNumber FROm case WHERE Status='New'];
        return NewCases;
    }

}