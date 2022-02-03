public with sharing abstract class VectorCalculator{
    public static Vector multiplyScalarWithVectorElements(Vector subjectVector, Decimal scalar){
        for(Integer i = 0; i < subjectVector.getSize(); i++){
            Decimal multipleResultForElement = scalar*subjectVector.getElementAtPosition(i); //allows for multiple to be seen in finest debug
            subjectVector.replaceElementAtPosition(i, multipleResultForElement);
        }
        return subjectVector;
    }
    public static Vector addScalarToVectorElements(Vector subjectVector, Decimal scalar){
        for(Integer i = 0; i < subjectVector.getSize(); i++){
            Decimal multipleResultForElement = scalar+subjectVector.getElementAtPosition(i);
            subjectVector.replaceElementAtPosition(i, multipleResultForElement);
        }
        return subjectVector;
    }
}