/*
Re-review sys of equations

xVector Calc (abst)
-would handle scalar multiplication and addition

Matrix Calc extends vector Calc
-would navigate vectors in map and facilitate matrix ops
-size check, messed up arithamtic between row vectors and column vectors


-Matrix structure-
Map<column Coordinate, Vector> ----implicitly my vectors become column...

IVector < needed?  will I bother to set up row vectors?  building them from matrix makes sense...
void populateScalarAtPosition(index, value)
Integer getVectorSize()


XXX IMatrix <not needed
void addColumn(IVector)
Integer getRowSize()
Integer getColumnSize()


-LATER-
Decimal calcDeterminant()


*/
public with sharing class Vector implements IVector, Comparable{
    
    private List<Decimal> vector;
    public Vector(){
        vector = new List<Decimal>();
    }
    public Vector(List<Decimal> vector){
        this.vector = vector;
    }
    public void replaceElementAtPosition(Integer position, Decimal value){
        if(vector.size() >= position){
            vector.set(position, value);
        }else{
            populateZeroUpToPosition(position, value);
            vector.add(value);
        }
        System.debug('vector '+vector);
    }
    public void populateElementAtPosition(Integer position, Decimal value){
        if(vector.size() >= position){
            vector.add(position, value);
        }else{
            populateZeroUpToPosition(position, value);
            vector.add(value);
        }
        System.debug('vector '+vector);
    }
    public Integer getSize(){
        return vector.size();
    }
    public Decimal getElementAtPosition(Integer position){
        Decimal resultElement;
        try{
            resultElement = vector[position];
        }catch(ListException error){
            resultElement = 0; //I don't care
        }
        return resultElement;
    }
    @testVisible
    private void populateZeroUpToPosition(Integer position, Decimal value){
        while(vector.size() < position){
            vector.add(0);
        }
    }
    public Integer compareTo(Object thingToCompare){
        Integer resultComparrison;
        if(thingToCompare instanceOf Vector){
            Vector compareToVector = (Vector)thingToCompare;
            if(vector.size() > compareToVector.getSize()){
                resultComparrison = 1;
            }else if(vector.size() < compareToVector.getSize()){
                resultComparrison = -1;
            }else{
                Decimal thisSum = 0;
                for(Integer i = 0; i < vector.size(); i++){
                    thisSum += vector[i];
                }
                Decimal compareSum = 0;
                for(Integer j = 0; j < compareToVector.getSize(); j++){
                    compareSum += compareToVector.getElementAtPosition(j);
                }
                resultComparrison = Integer.valueOf(thisSum - compareSum);
            }
        }
        return resultComparrison;
    }
}