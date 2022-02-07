public class Element {
    public Integer xCoordinate;
    public Integer yCoordinate;
    public Decimal value;
    //built to make transposes much more intuitive
    //build methods to make this distinguishable
    
    //hashCode
    //equals
    public Long hashCode(){
        Long hashValue;
        hashValue = xCoordinate.format().hashCode();
        hashValue += yCoordinate.format().hashCode();
        hashValue += value.format().hashCode();
        return hashValue;
    }
    public Boolean equals(Object obj){
        if(obj instanceof Element){
            return hashCode() == obj.hashCode();
        }else{
            return false;
        }
    }
}
