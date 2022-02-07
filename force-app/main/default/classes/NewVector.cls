public class NewVector{
    private List<Element> elements = new List<Element>();
    private VectorType type;
    private Integer yDim;
    private Integer xDim;
    public NewVector(VectorType type){
        this.type = type;
    }
    public void addElement(Element subjectElement){
        if(elements.isEmpty()){
            yDim = type == VectorType.rowVector ? subjectElement.yCoordinate : null;
            xDim = type == VectorType.columnVector ? subjectElement.xCoordinate : null;
            elements.add(subjectElement);
        }else{
            if(type == VectorType.rowVector && yDim == subjectElement.yCoordinate && !isCoordinateRegistered(subjectElement)){
                elements.add(subjectElement);
            }else if(type == VectorType.columnVector && xDim == subjectElement.xCoordinate && !isCoordinateRegistered(subjectElement)){
                elements.add(subjectElement);
            }
        }
    }
    @testVisible
    private Boolean isCoordinateRegistered(Element subjectElement){
        Boolean result = true;
        for(Element registeredElement : elements){
            if(type == VectorType.rowVector){
                result = result && registeredElement.xCoordinate == subjectElement.xCoordinate;
            }else{
                result = result && registeredElement.yCoordinate == subjectElement.yCoordinate;
            }
        }
        return result;
    }
    
    public enum VectorType {rowVector, columnVector} //row vector means that all yCoordinates on elements the same; column vector means that all xCoordinates on elements the same
}
