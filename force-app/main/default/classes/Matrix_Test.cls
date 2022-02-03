@istest
private class Matrix_Test {
    @isTest
    private static void transposeBullshit(){
        Vector first = new Vector(new List<Decimal>{1, 2, 3});
        Vector second = new Vector(new List<Decimal>{4, 5, 6});
        Vector third = new Vector(new List<Decimal>{7, 8, 9});

        Map<Integer, Vector> pseudoMatrix = new Map<Integer, Vector>();
        pseudoMatrix.put(0, first);
        pseudoMatrix.put(1, second);
        pseudoMatrix.put(3, third);

        Matrix testMatrix = new Matrix(pseudoMatrix);
        System.debug('FIND YOUR TRANSPOSE');
        System.debug(testMatrix.transpose());
    }
}
