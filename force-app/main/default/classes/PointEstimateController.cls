public with sharing class PointEstimateController
{
    public PointEstimateController(){}
    
    @testVisible
    private static Integer testType = 0;

    //Monolythic and dumb just like I need
    @AuraEnabled
    public static String handleEventData(String ticketNumber, String voterName, Integer point)
    {
        String response = '';

        //Abstract mapping to PE obj and pass class-lvl obj to svc that handles actual PE build and publish
        Point_Estimate__e pointEstimate = new Point_Estimate__e();
        pointEstimate.Ticket_Number__c = ticketNumber;
        pointEstimate.Voter_Name__c = voterName;
        pointEstimate.Point_Value__c = point;

        try
        {
            if(testType == 1)
            {
                Decimal intentionalError = 0/0;
            }

            Eventbus.publish(pointEstimate);
            response = 'Event Published';
        }
        catch(Exception error)
        {
            response = 'Event Not Published because '+error.getMessage();
        }
        return response;
    }
}