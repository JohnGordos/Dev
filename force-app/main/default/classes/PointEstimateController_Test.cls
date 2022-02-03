@isTest
public class PointEstimateController_Test
{
    @isTest
    private static void testPointEstimateController()
    {
        Test.startTest();
        String result = PointEstimateController.handleEventData('test', 'test', 4);
        Test.stopTest();

        System.assertEquals('Event Published', result);
    }

    @isTest
    private static void testPointEstimateControllerFailure()
    {
        PointEstimateController.testType = 1;
        Test.startTest();
        String result = PointEstimateController.handleEventData('test', 'test', 4);
        Test.stopTest();
        
        System.assert(result.contains('Event Not Published because'));
    }
}