public with sharing class MatrixCalculator extends VectorCalculator{
    public static Matrix multiplyScalarWithMatrixElements(Matrix subjectMatrix, Decimal scalar){
        for(Integer columnCoord : subjectMatrix.getColumnCoordinates()){
            Vector modifiedVector = multiplyScalarWithVectorElements(subjectMatrix.getVectorAtColumnCoordinate(columnCoord), scalar);
            subjectMatrix.setVectorAtColumnCoordinate(columnCoord, modifiedVector);
        }
        return subjectMatrix;
    }
    public static Matrix addSclarToMatrixElements(Matrix subjectMatrix, Decimal scalar){
        for(Integer columnCoord : subjectMatrix.getColumnCoordinates()){
            Vector modifiedVector = addScalarToVectorElements(subjectMatrix.getVectorAtColumnCoordinate(columnCoord), scalar);
            subjectMatrix.setVectorAtColumnCoordinate(columnCoord, modifiedVector);
        }
        return subjectMatrix;
    }
}