@istest
private class Matrix_Test{
    @isTest
    private static void givenValidPseudoMatrixWhenConstructorThenAssertExpectedMatrixCreated(){
        List<Decimal> first = new List<Decimal>{1, 2, 3};
        List<Decimal> second = new List<Decimal>{4, 5, 6};
        List<Decimal> third = new List<Decimal>{7, 8, 9};

        Map<Integer, List<Decimal>> pseudoMatrix = new Map<Integer, List<Decimal>>();
        pseudoMatrix.put(0, first);
        pseudoMatrix.put(1, second);
        pseudoMatrix.put(2, third);

        Matrix resultMatrix = new Matrix(pseudoMatrix);
        System.assertEquals(3, resultMatrix.getColumnCoordinates().size());
        System.assertEquals(3, resultMatrix.getVectorAtColumnCoordinate(0).getSize());
        
        Vector firstVector = resultMatrix.getVectorAtColumnCoordinate(0);
        System.assertEquals(1, firstVector.getElementAtPosition(0));
        System.assertEquals(2, firstVector.getElementAtPosition(1));
        System.assertEquals(3, firstVector.getElementAtPosition(2));

        Vector secondVector = resultMatrix.getVectorAtColumnCoordinate(1);
        System.assertEquals(4, secondVector.getElementAtPosition(0));
        System.assertEquals(5, secondVector.getElementAtPosition(1));
        System.assertEquals(6, secondVector.getElementAtPosition(2));

        Vector thirdVector = resultMatrix.getVectorAtColumnCoordinate(2);
        System.assertEquals(7, thirdVector.getElementAtPosition(0));
        System.assertEquals(8, thirdVector.getElementAtPosition(1));
        System.assertEquals(9, thirdVector.getElementAtPosition(2));
    }
    @isTest
    private static void givenInValidPseudoMatrixWhenConstructorThenAssertExpectedMatrixCreated(){
        List<Decimal> first = new List<Decimal>{1, 2, 3};
        List<Decimal> second = new List<Decimal>{4, 5, 6, 7, 8, 9};

        Map<Integer, List<Decimal>> pseudoMatrix = new Map<Integer, List<Decimal>>();
        pseudoMatrix.put(0, first);
        pseudoMatrix.put(1, second);
        try{
            Matrix resultMatrix = new Matrix(pseudoMatrix);
            System.assert(false);
        }catch(Matrix.MatrixSizeException error){
            System.assert(true);
        }catch(Exception error){
            System.assert(false);
        }
    }
    @isTest
    private static void givenValidVectorMapWhenConstructorThenAssertExpectedMatrixCreated(){
        Vector first = new Vector(new List<Decimal>{1, 2, 3});
        Vector second = new Vector(new List<Decimal>{4, 5, 6});
        Vector third = new Vector(new List<Decimal>{7, 8, 9});

        Map<Integer, Vector> pseudoMatrix = new Map<Integer, Vector>();
        pseudoMatrix.put(0, first);
        pseudoMatrix.put(1, second);
        pseudoMatrix.put(2, third);

        Matrix resultMatrix = new Matrix(pseudoMatrix);
        System.assertEquals(3, resultMatrix.getColumnCoordinates().size());
        System.assertEquals(3, resultMatrix.getVectorAtColumnCoordinate(0).getSize());
        
        Vector firstVector = resultMatrix.getVectorAtColumnCoordinate(0);
        System.assertEquals(1, firstVector.getElementAtPosition(0));
        System.assertEquals(2, firstVector.getElementAtPosition(1));
        System.assertEquals(3, firstVector.getElementAtPosition(2));

        Vector secondVector = resultMatrix.getVectorAtColumnCoordinate(1);
        System.assertEquals(4, secondVector.getElementAtPosition(0));
        System.assertEquals(5, secondVector.getElementAtPosition(1));
        System.assertEquals(6, secondVector.getElementAtPosition(2));

        Vector thirdVector = resultMatrix.getVectorAtColumnCoordinate(2);
        System.assertEquals(7, thirdVector.getElementAtPosition(0));
        System.assertEquals(8, thirdVector.getElementAtPosition(1));
        System.assertEquals(9, thirdVector.getElementAtPosition(2));
    }
    @isTest
    private static void givenInValidVectorMapWhenConstructorThenAssertExpectedMatrixCreated(){
        Vector first = new Vector(new List<Decimal>{1, 2, 3});
        Vector second = new Vector(new List<Decimal>{4, 5, 6, 7, 8, 9});

        Map<Integer, Vector> pseudoMatrix = new Map<Integer, Vector>();
        pseudoMatrix.put(0, first);
        pseudoMatrix.put(1, second);
        try{
            Matrix resultMatrix = new Matrix(pseudoMatrix);
            System.assert(false);
        }catch(Matrix.MatrixSizeException error){
            System.assert(true);
        }catch(Exception error){
            System.assert(false);
        }
    }
    @isTest
    private static void givenMatrixWithNColumnsWhenGetColumnCoordinatesThenAssertExpectedCoordinates(){
        Map<Integer, Vector> pseudoMatrix = new Map<Integer, Vector>();
        for(Integer i = 0; i < 100; i++){
            pseudoMatrix.put(i, new Vector(new List<Decimal>{i}));
        }
        pseudoMatrix.put(9999, new Vector(new List<Decimal>{9999}));

        Matrix resultMatrix = new Matrix(pseudoMatrix);
        System.assertEquals(101, resultMatrix.getColumnCoordinates().size());
        System.assert(resultMatrix.getColumnCoordinates().contains(9999));
        System.assert(resultMatrix.getColumnCoordinates().contains(20));
        System.assert(!resultMatrix.getColumnCoordinates().contains(9998));
    }
    @isTest
    private static void givenMatrixWithNColumnsWhenGetVectorAtColumnCoordinateThenAssertExpectedVector(){
        Map<Integer, Vector> pseudoMatrix = new Map<Integer, Vector>();
        for(Integer i = 0; i < 100; i++){
            pseudoMatrix.put(i, new Vector(new List<Decimal>{i}));
        }
        pseudoMatrix.put(9999, new Vector(new List<Decimal>{9999}));
        Matrix testMatrix = new Matrix(pseudoMatrix);
        for(Integer i = 0; i < 100; i++){
            Vector resultVector = testMatrix.getVectorAtColumnCoordinate(i);
            System.assertEquals(i, resultVector.getElementAtPosition(0));
        }
        System.assertEquals(9999, testMatrix.getVectorAtColumnCoordinate(9999).getElementAtPosition(0));
    }
    @isTest
    private static void givenMatrixWithNColumnsWhenSetVectorAtColumnCoordinateThenAssertExpectedCoordinates(){
        Map<Integer, Vector> pseudoMatrix = new Map<Integer, Vector>();
        for(Integer i = 0; i < 100; i++){
            pseudoMatrix.put(i, new Vector(new List<Decimal>{i}));
        }
        Matrix testMatrix = new Matrix(pseudoMatrix);
        Vector testVectorOne = new Vector(new List<Decimal>{8888});
        Vector testVectorTwo = new Vector(new List<Decimal>{9999});
        testMatrix.setVectorAtColumnCoordinate(0, testVectorOne);
        testMatrix.setVectorAtColumnCoordinate(1, testVectorTwo);
        Vector resultVectorOne = testMatrix.getVectorAtColumnCoordinate(0);
        System.assertEquals(8888, resultVectorOne.getElementAtPosition(0));

        Vector resultVectorTwo = testMatrix.getVectorAtColumnCoordinate(1);
        System.assertEquals(9999, resultVectorTwo.getElementAtPosition(0));

        for(integer i = 2; i < 100; i++){
            Vector resultVector = testMatrix.getVectorAtColumnCoordinate(i);
            System.assertEquals(i, resultVector.getElementAtPosition(0));
        }
    }
    @isTest
    private static void givenMatrixWhenGetElementAtCoordinatesThenAssertExpectedElement(){
        Map<Integer, Vector> pseudoMatrix = new Map<Integer, Vector>();
        Vector first = new Vector(new List<Decimal>{1, 2, 3});
        Vector second = new Vector(new List<Decimal>{4, 5, 6, 7, 8, 9});
        pseudoMatrix.put(0, first);
        pseudoMatrix.put(1, second);
        Matrix testMatrix = new Matrix(pseudoMatrix);
        Decimal elementResult = testMatrix.getElementAtCoordinates(0, 0);
        System.assertEquals(1, elementResult);
        Decimal elementResultTwo = testMatrix.getElementAtCoordinates(1, 0);
        System.assertEquals(4, elementResultTwo);

        Decimal elementResultThree = testMatrix.getElementAtCoordinates(1, 5);
        System.assertEquals(9, elementResultThree);
    }
    @isTest
    private static void givenMatrixWhenReplaceElementAtCoordinatesThenAssertExpectedElement(){
        Map<Integer, Vector> pseudoMatrix = new Map<Integer, Vector>();
        Vector first = new Vector(new List<Decimal>{1, 2, 3});
        Vector second = new Vector(new List<Decimal>{4, 5, 6, 7, 8, 9});
        pseudoMatrix.put(0, first);
        pseudoMatrix.put(1, second);
        Matrix testMatrix = new Matrix(pseudoMatrix);
        testMatrix.replaceElementAtCoordinates(0, 0, 10);
        Decimal elementResult = testMatrix.getElementAtCoordinates(0, 0);
        System.assertEquals(10, elementResult);
        testMatrix.replaceElementAtCoordinates(1, 0, 11);
        Decimal elementResultTwo = testMatrix.getElementAtCoordinates(1, 0);
        System.assertEquals(11, elementResultTwo);
        testMatrix.replaceElementAtCoordinates(1, 5, 999);
        Decimal elementResultThree = testMatrix.getElementAtCoordinates(1, 5);
        System.assertEquals(999, elementResultThree);
    }
    @isTest
    private static void givenTestNXNMatrixWhenTransposeThenAssertElementsInExpectedPosition(){
        Vector first = new Vector(new List<Decimal>{1, 2, 3});
        Vector second = new Vector(new List<Decimal>{4, 5, 6});
        Vector third = new Vector(new List<Decimal>{7, 8, 9});

        Map<Integer, Vector> pseudoMatrix = new Map<Integer, Vector>();
        pseudoMatrix.put(0, first);
        pseudoMatrix.put(1, second);
        pseudoMatrix.put(2, third);

        Matrix testMatrix = new Matrix(pseudoMatrix);
        Matrix result = testMatrix.transpose();
        System.debug('FIND YOUR TRANSPOSE');
        System.debug(result);

        Vector firstResultVector = result.getVectorAtColumnCoordinate(0);
        System.assertEquals(1, firstResultVector.getElementAtPosition(0));
        System.assertEquals(4, firstResultVector.getElementAtPosition(1));
        System.assertEquals(7, firstResultVector.getElementAtPosition(2));

        Vector secondResultVector = result.getVectorAtColumnCoordinate(1);
        System.assertEquals(2, secondResultVector.getElementAtPosition(0));
        System.assertEquals(5, secondResultVector.getElementAtPosition(1));
        System.assertEquals(8, secondResultVector.getElementAtPosition(2));

        Vector thirdResultVector = result.getVectorAtColumnCoordinate(2);
        System.assertEquals(3, thirdResultVector.getElementAtPosition(0));
        System.assertEquals(6, thirdResultVector.getElementAtPosition(1));
        System.assertEquals(9, thirdResultVector.getElementAtPosition(2));
    }
    @isTest
    private static void givenTestNXMWhereMGreaterThanNMatrixWhenTransposeThenAssertElementsInExpectedPosition(){
        Vector first = new Vector(new List<Decimal>{1, 2, 3});
        Vector second = new Vector(new List<Decimal>{4, 5, 6});
        /* OG representation 2 x 3
            1 4
            2 5
            3 6

           New Shit 3 x 2
           1 2 3
           4 5 6
        */
        Map<Integer, Vector> pseudoMatrix = new Map<Integer, Vector>();
        pseudoMatrix.put(0, first);
        pseudoMatrix.put(1, second);

        Matrix testMatrix = new Matrix(pseudoMatrix);
        Matrix result = testMatrix.transpose();
        System.debug('FIND YOUR TRANSPOSE');
        System.debug(result);

        Vector firstResultVector = result.getVectorAtColumnCoordinate(0);
        System.assertEquals(2, firstResultVector.getSize());
        System.assertEquals(1, firstResultVector.getElementAtPosition(0));
        System.assertEquals(4, firstResultVector.getElementAtPosition(1));

        Vector secondResultVector = result.getVectorAtColumnCoordinate(1);
        System.assertEquals(2, secondResultVector.getSize());
        System.assertEquals(2, secondResultVector.getElementAtPosition(0));
        System.assertEquals(5, secondResultVector.getElementAtPosition(1));

        Vector thirdResultVector = result.getVectorAtColumnCoordinate(2);
        System.assertEquals(2, thirdResultVector.getSize());
        System.assertEquals(3, thirdResultVector.getElementAtPosition(0));
        System.assertEquals(6, thirdResultVector.getElementAtPosition(1));
    }
    @isTest
    private static void givenTestNXMWhereMLessThanNMatrixWhenTransposeThenAssertElementsInExpectedPosition(){
        Vector first = new Vector(new List<Decimal>{1, 2});
        Vector second = new Vector(new List<Decimal>{3, 4});
        Vector third = new Vector(new List<Decimal>{5, 6});
        /*OG representation
            1 3 5
            2 4 6

          New Shit
          1 2
          3 4
          5 6
        */
        Map<Integer, Vector> pseudoMatrix = new Map<Integer, Vector>();
        pseudoMatrix.put(0, first);
        pseudoMatrix.put(1, second);
        pseudoMatrix.put(2, third);

        Matrix testMatrix = new Matrix(pseudoMatrix);
        Matrix result = testMatrix.transpose();
        System.debug('FIND YOUR TRANSPOSE');
        System.debug(result);

        Vector firstResultVector = result.getVectorAtColumnCoordinate(0);
        System.assertEquals(3, firstResultVector.getSize());
        System.assertEquals(1, firstResultVector.getElementAtPosition(0));
        System.assertEquals(3, firstResultVector.getElementAtPosition(1));
        System.assertEquals(5, firstResultVector.getElementAtPosition(2));

        Vector secondResultVector = result.getVectorAtColumnCoordinate(1);
        System.assertEquals(3, secondResultVector.getSize());
        System.assertEquals(2, secondResultVector.getElementAtPosition(0));
        System.assertEquals(4, secondResultVector.getElementAtPosition(1));
        System.assertEquals(6, secondResultVector.getElementAtPosition(2));
    }
    @isTest
    private static void givenTestMatrixWhenTransposeTwiceThenAssertElementsInExpectedPosition(){
        Vector first = new Vector(new List<Decimal>{1, 2});
        Vector second = new Vector(new List<Decimal>{3, 4});
        Vector third = new Vector(new List<Decimal>{5, 6});

        Map<Integer, Vector> pseudoMatrix = new Map<Integer, Vector>();
        pseudoMatrix.put(0, first);
        pseudoMatrix.put(1, second);
        pseudoMatrix.put(2, third);

        Matrix testMatrix = new Matrix(pseudoMatrix);
        Matrix result = testMatrix.transpose();
        System.debug('FIND YOUR TRANSPOSE');
        System.debug(result);

        Matrix resultAfterSecondTranspose = result.transpose();
        System.debug('FIND YOUR 2nd TRANSPOSE');
        System.debug(resultAfterSecondTranspose);

        Vector firstResultVector = resultAfterSecondTranspose.getVectorAtColumnCoordinate(0);
        System.assertEquals(2, firstResultVector.getSize());
        System.assertEquals(1, firstResultVector.getElementAtPosition(0));
        System.assertEquals(2, firstResultVector.getElementAtPosition(1));

        Vector secondResultVector = resultAfterSecondTranspose.getVectorAtColumnCoordinate(1);
        System.assertEquals(2, secondResultVector.getSize());
        System.assertEquals(3, secondResultVector.getElementAtPosition(0));
        System.assertEquals(4, secondResultVector.getElementAtPosition(1));

        Vector thirdResultVector = resultAfterSecondTranspose.getVectorAtColumnCoordinate(2);
        System.assertEquals(2, thirdResultVector.getSize());
        System.assertEquals(5, thirdResultVector.getElementAtPosition(0));
        System.assertEquals(6, thirdResultVector.getElementAtPosition(1));
    }
}
