public with sharing class Matrix{
    @testVisible
    private Map<Integer, Vector> matrix = new Map<Integer, Vector>(); //by columns? more sensible name than just matrix
    private Integer defaultVectorSize{
        get{
            if(defaultVectorSize == null && matrix.get(0) != null){
                defaultVectorSize = matrix.get(0).getSize();
            }
            return defaultVectorSize;
        }set;
    }
    public Matrix(Map<Integer, List<Decimal>> matrix){
        Integer initialVectorSize = matrix.get(0)?.size();
        for(Integer columnCoord : matrix.keySet()){
            if(initialVectorSize == matrix.get(columnCoord).size()){
                this.matrix.put(columnCoord, new Vector(matrix.get(columnCoord)));
            }else{
                System.debug('you dummy, don\'t register vectors of different sizes to the same matrix');
                throw new MatrixSizeException();
            }
        }
    }
    public Matrix(Map<Integer, Vector> matrix){
        Integer initialVectorSize = matrix.get(0)?.getSize();
        for(Integer columnCoord : matrix.keySet()){            
            if(initialVectorSize == matrix.get(columnCoord).getSize()){
                this.matrix.put(columnCoord, matrix.get(columnCoord));
            }else{
                System.debug('you dummy, don\'t register vectors of different sizes to the same matrix');
                throw new MatrixSizeException();
            }
        }
    }
    
    public Set<Integer> getColumnCoordinates(){
        return matrix.keySet();
    }
    public Vector getVectorAtColumnCoordinate(Integer columnCoord){
        Vector result;
        if(matrix.containsKey(columnCoord)){
            result = matrix.get(columnCoord);
        }
        return result;
    }
    public void setVectorAtColumnCoordinate(Integer columnCoord, Vector subjectVector){
        if(matrix.containsKey(columnCoord) && isSubjectVectorSizeValid(subjectVector)){
            matrix.put(columnCoord, subjectVector);
        }else{
            throw new MatrixSizeException();
        }
    }
    public Decimal getElementAtCoordinates(Integer columnCoord, Integer rowCoord){
        Decimal result;
        if(matrix.containsKey(columnCoord)){
            result = matrix.get(columnCoord).getElementAtPosition(rowCoord); //this is stupid b/c 0 returned in vector but null in matrix
        }
        return result;
    }
    //TRANSPOSE matrix
    /*
    i did not define col and row vector so conception harder
    tests
    transpose of a transpose = og matrix
    k * transpose A = (t * A) transpose

    element @ col coord 1 does not change
    element @ col coord n does not change
    [a, b] > [a, c]
    [c, d] > [b, d]

    matrix.keySet().size becomes size of new vectors
    you can't concentrate, brute force transpose on 3 diff types of matricies and find pattern jenus

    Try to transpose a List<List<Decimal>> first?
    */
    public Map<Integer, Vector> transpose(){  //whatever happens, return an actual matrix
        //Vector subjectVector
        Map<Integer, Vector> transposedMatrixResult = new Map<Integer, Vector>();
        //instead of looping through, take sample vector
        Vector sampleColumnVector = matrix.get(0);
        for(Integer i = 0; i < sampleColumnVector.getSize(); i++){

            for(Integer columnCoordinate : matrix.keySet()){
                if(transposedMatrixResult.get(i) == null){
                    transposedMatrixResult.put(i, new Vector(new List<Decimal>{sampleColumnVector.getElementAtPosition(i)}));
                }else{
                    /* Nah, you're not gonna brute force this
                    Vector subjectVector = transposedMatrixResult.get(i);
                    subjectVector.populateElementAtPosition(columnCoordinate, subjectVector.getElementAtPosition(i));
                    transposedMatrixResult.put(i, subjectVector);
                    */
                }
            }

        }
        /*
        for(Integer columnCoord : matrix.keySet()){ //becomes the number of elements in each vector
            Vector newRowVector = new Vector();
            Vector columnVector = matrix.get(columnCoord);
            for(Integer i = 0; i < columnVector.getSize(); i++){ //becomes the number of columns
                
                newRowVector.populateElementAtPosition(i, columnVector.getElementAtPosition(i));
            }
        }*/
        return transposedMatrixResult;
    }
    private Boolean isSubjectVectorSizeValid(Vector subjectVector){
        return subjectVector.getSize() == defaultVectorSize;
    }
    public class MatrixSizeException extends Exception{}
}