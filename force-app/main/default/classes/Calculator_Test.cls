@isTest
private class Calculator_Test {
    private static Integer first;
    private static Integer second;
    private enum testType {ADD, SUB, NEG_MULT, MULT, NEG_DIV, NEG_RES_DIV, DIV}

    @TestSetup
    static void trailheadRequirement(){

    }
    
    static void makeDumbData(testType dumbtype){
        if(dumbtype == testType.ADD || dumbtype == testType.SUB){
            first = 1;
            second = 1;
        } else if(dumbtype == testType.NEG_MULT){
            first = 0;
            second = 999999999;
        } else if(dumbtype == testType.MULT){
            first = 3;
            second = 2;
        } else if(dumbtype == testType.NEG_DIV){
            first = 3;
            second = 0;
        } else if(dumbtype == testType.DIV){
            first = 6;
            second = 2;
        } else if(dumbtype == testType.NEG_RES_DIV){
            first = -6;
            second = 2;
        }
    }

    @isTest
    private static void givenBullshitIntegersWhenAdditionThenAdd(){
        makeDumbData(testType.ADD);
        System.assertEquals(2, Calculator.addition(first, second));
    }

    @isTest
    private static void givenBullshitIntegersWhenSubtractionThenSub(){
        makeDumbData(testType.SUB);
        System.assertEquals(0, Calculator.subtraction(first, second));
    }

    @isTest
    private static void givenInvalidIntegersWhenMultiplicationThenMult(){
        makeDumbData(testType.NEG_MULT);
        try {
            Integer result = Calculator.multiply(first, second);
            System.assert(false);
        } catch (Exception error) {
            System.assert(error.getMessage().contains('make sense to multiply by zero'));
        }
    }

    @isTest
    private static void givenValidIntegersWhenMultiplicationThenMult(){
        makeDumbData(testType.MULT);
        System.assertEquals(6, Calculator.multiply(first, second));
    }

    @isTest
    private static void givenInValidIntegersWhenDivisionThenDivide(){
        makeDumbData(testType.NEG_DIV);
        try {
            Decimal result = Calculator.divide(first, second);
            System.assert(false);
        } catch (Exception error) {
            System.assert(error.getMessage().contains('by zero'));
        }
    }

    @isTest
    private static void givenInValidResultWhenDivisionThenDivide(){
        makeDumbData(testType.NEG_RES_DIV);
        try {
            Decimal result = Calculator.divide(first, second);
            System.assert(false);
        } catch (Exception error) {
            System.assert(error.getMessage().contains('Division returned a negative value.'));
        }
    }

    @isTest
    private static void givenValidIntegersWhenDivisionThenDivide(){
        makeDumbData(testType.DIV);
        System.assertEquals(3, Calculator.divide(first, second));
    }
}