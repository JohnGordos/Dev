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
                throw new MatrixSizeException('Registered size '+initialVectorSize+' attempted to add vector of size '+matrix.get(columnCoord).size()+'to column coord '+columnCoord);
            }
        }
    }
    public Matrix(Map<Integer, Vector> matrix){
        Integer initialVectorSize = matrix.get(0)?.getSize();
        for(Integer columnCoord : matrix.keySet()){            
            if(initialVectorSize == matrix.get(columnCoord).getSize()){
                this.matrix.put(columnCoord, matrix.get(columnCoord));
            }else{
                throw new MatrixSizeException('Registered size '+initialVectorSize+' attempted to add vector of size '+matrix.get(columnCoord).getSize()+'to column coord '+columnCoord);
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
            throw new MatrixSizeException('Registered size '+defaultVectorSize+' attempted to add vector of size '+subjectVector.getSize()+'to column coord '+columnCoord);
        }
    }
    public Decimal getElementAtCoordinates(Integer columnCoord, Integer rowCoord){
        Decimal result;
        if(matrix.containsKey(columnCoord)){
            result = matrix.get(columnCoord).getElementAtPosition(rowCoord);
        }
        return result;
    }
    public void replaceElementAtCoordinates(Integer columnCoord, Integer rowCoord, Decimal value){
        if(matrix.containsKey(columnCoord) && matrix.get(columnCoord)?.getElementAtPosition(rowCoord) != null){
            matrix.get(columnCoord).replaceElementAtPosition(rowCoord, value);
        }
    }
    public Matrix transpose(){
        Map<Integer, Vector> transposedMatrixResult = new Map<Integer, Vector>();
        for(Integer columnCoordinate : matrix.keySet()){
            Vector subjectVector = matrix.get(columnCoordinate);
            for(Integer i = 0; i < subjectVector.getSize(); i++){
                if(transposedMatrixResult.get(i) == null){
                    if(subjectVector.getElementAtPosition(columnCoordinate) != null){
                        transposedMatrixResult.put(i, new Vector(new List<Decimal>{subjectVector.getElementAtPosition(i)}));
                    }
                }else{
                    transposedMatrixResult.get(i).populateElementAtPosition(columnCoordinate, subjectVector.getElementAtPosition(i));
                }
            }
        }
        return new Matrix(transposedMatrixResult);
    }
    private Boolean isSubjectVectorSizeValid(Vector subjectVector){
        return subjectVector.getSize() == defaultVectorSize;
    }
    public class MatrixSizeException extends Exception{}
}