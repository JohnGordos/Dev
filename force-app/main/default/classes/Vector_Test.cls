@isTest
public class Vector_Test {
    //I know my vector just wraps a list, but this is crafty
    @isTest
    private static void givenVectorWhenGetSizeThenReturnExpectedSize(){
        for(Integer i = 0; i < 100; i++){
            Integer randomSize = Math.round(getRandomDecimal(20, 1));
            List<Decimal> pseudoVector = new List<Decimal>();
            for(Integer j = 0; j < randomSize; j++){
                pseudoVector.add(j);
            }
            Vector testVector = new Vector(pseudoVector);
            System.assertEquals(randomSize, testVector.getSize());
        }
    }
    @isTest
    private static void givenVectorAndValidPositionWhenPopulateScalarAtPositionThenReturnExpectedElement(){
        List<Decimal> pseudoVector = new List<Decimal>();
        Map<Integer, Decimal> expectedElementsAtPosition = new Map<Integer, Decimal>();
        Integer randomSize = 5;//Math.round(getRandomDecimal(20, 1));
        for(Integer i = 0; i < randomSize; i++){
            Decimal randomElement = getRandomDecimal(10, 1);
            expectedElementsAtPosition.put(i, randomElement);
            pseudoVector.add(randomElement);
        }
        System.debug('expectedElementsAtPosition '+expectedElementsAtPosition);
        Vector testVector = new Vector(pseudoVector);
        for(Integer i = 0; i < randomSize; i++){
            Integer randomPosition = getRandomDecimal(randomSize, 0).round(System.RoundingMode.DOWN).intValue();
            System.assertEquals(expectedElementsAtPosition.get(randomPosition), testVector.getElementAtPosition(randomPosition));
        }
        System.assertEquals(0, testVector.getElementAtPosition(5*randomSize));
    }
    @isTest
    private static void givenVectorWhenPopulateElementAtPositionWithValidAndInvalidPositionsThenReturnExpectedElement(){
        Vector testVector = new Vector(new List<Decimal>{1.1, 2.2, 3.3, 9999999});
        testVector.populateElementAtPosition(0, 3.14);
        Decimal eulersSpecialFwen = Decimal.valueOf(Math.E);
        System.assertEquals(3.14, testVector.getElementAtPosition(0));
        System.assertEquals(1.1, testVector.getElementAtPosition(1));
        System.assertEquals(2.2, testVector.getElementAtPosition(2));
        System.assertEquals(3.3, testVector.getElementAtPosition(3));
        System.assertEquals(9999999, testVector.getElementAtPosition(4));
        testVector.populateElementAtPosition(30, eulersSpecialFwen);
        //Given a vector of size n and a request to populate a value at position k st k > n, ensure 0 is populated for positions n + 1 to k - 1
        System.assertEquals(eulersSpecialFwen, testVector.getElementAtPosition(30));
        System.assertEquals(0, testVector.getElementAtPosition(5));
        System.assertEquals(0, testVector.getElementAtPosition(29));
        System.assertEquals(31, testVector.getSize());
    }
    @isTest
    private static void givenVectorsOfSameValuesDifferentSizeWhenSortThenReturnExpectedOrder(){
        List<Vector> vectorsToSort = new List<Vector>();
        Integer maxLength = 10;
        for(Integer i = 3; i < maxLength; i++){
            List<Decimal> pseudoVector = new List<Decimal>();
            for(Integer j = 0; j < i; j++){
                pseudoVector.add(0);
            }
            vectorsToSort.add(new Vector(pseudoVector));
        }
        vectorsToSort.sort();
        Integer priorSize = 0;
        for(Vector testVector : vectorsToSort){
            System.assert(testVector.getSize() > priorSize, 'The greatest vectors should be at the front of the list.  Test vector size: '+testVector.getSize()+' Prior size '+priorSize);
            priorSize = testVector.getSize();
        }
    }
    @isTest
    private static void givenVectorsOfDifferentValuesSameSizeWhenSortThenReturnExpectedOrder(){
        List<Vector> vectorsToSort = new List<Vector>();
        List<Decimal> smallestPseudoVector = new List<Decimal>();
        smallestPseudoVector.add(1);
        smallestPseudoVector.add(1);
        smallestPseudoVector.add(1);
        vectorsToSort.add(new Vector(smallestPseudoVector));
        List<Decimal> mediumPseudoVector = new List<Decimal>();
        mediumPseudoVector.add(2);
        mediumPseudoVector.add(2);
        mediumPseudoVector.add(2);
        vectorsToSort.add(new Vector(mediumPseudoVector));
        List<Decimal> largestPseudoVector = new List<Decimal>();
        largestPseudoVector.add(3);
        largestPseudoVector.add(3);
        largestPseudoVector.add(3);
        vectorsToSort.add(new Vector(largestPseudoVector));
        vectorsToSort.sort();
        Decimal formerSum = 0;
        for(Vector testVector : vectorsToSort){
            Decimal thisSum = 0;
            for(Integer i = 0; i < testVector.getSize(); i++){
                thisSum += testVector.getElementAtPosition(i);
            }
            System.assert(thisSum > formerSum, 'The greatest vectors should be at the front of the list.  Test vector element sum: '+thisSum+' Prior sum '+formerSum);
            formerSum = thisSum;
        }
    }
    private static List<Vector> generateRandomVectors(Integer numberOfVectors){
        List<Vector> result = new List<Vector>();
        for(Integer i = 0; i < numberOfVectors; i++){
            Integer randomSize = Math.round(getRandomDecimal(20, 1));
            List<Decimal> pseudoVector = new List<Decimal>();
            for(Integer j = 0; j < randomSize; j++){
                pseudoVector.add(j);
            }
            result.add(new Vector(pseudoVector));
        }
        return result;
    } 
    private static Decimal getRandomDecimal(Decimal min, Decimal max){
        Decimal range = max - min;
        return (range * Math.random()) + min;
    }
}