@isTest
private class ExternalSearch_Tests {
  @isTest
  static void test_method_one() {
    HttpMockFactory mock = new HttpMockFactory(200, 'OK', 'I found it!', new Map<String,String>());
    Test.setMock(HttpCalloutMock.class, mock);
    String result;
    Test.startTest();
      result = ExternalSearch.googleIt('epic search');
    Test.stopTest();
    system.assertEquals('I found it!', result);
  }

  @isTest
  static void givenSearchStringWhenCuriousReturnError() {
    Test.setMock(HttpCalloutMock.class, new HttpMockFactory(500, 'BAAAAD', 'No server found', new Map<String,String>()));
    Test.startTest();
      try{
        String result = ExternalSearch.googleIt('nothing bad will happen');
        System.assert(false);          
      }catch(Exception error){
        System.assert(true);
        System.debug(error.getMessage());
        System.assert(error.getMessage().contains('500'));
      }
    Test.stopTest();
  }
}