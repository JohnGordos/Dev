public class MatrixMath {
//handles basic operations for nxn matricies
//
	
    public static Boolean ValidateDim(List<List<Decimal>> matrix1,List<List<Decimal>> matrix2){
        Boolean dimmatch = true;
        Integer rowspace1;
        Integer rowspace2;
        if(matrix1.size() == 0 || matrix2.size() == 0 || matrix1.size() != matrix2.size()){
            return false;
        }
        rowspace1 = matrix1.size();
        //confirm first matrix is nxn
        for(List<Decimal> row : matrix1){
            if(row.size()!=rowspace1){
                dimmatch = false;
                return dimmatch;
            }
        }
        
        rowspace2 = matrix2.size();
        for(List<Decimal> row2 : matrix2){
            if(row2.size()!=rowspace2){
                dimmatch = false;
                return dimmatch;
            }
        }
        if(rowspace1!=rowspace2){
            dimmatch = false;
            return dimmatch;
        }
        return dimmatch;
    }
    
     public static List<List<Decimal>> Multi(List<List<Decimal>> matrix1, List<List<Decimal>> matrix2){
		List<List<Decimal>> result = new List<List<Decimal>>();
         
         if(ValidateDim(matrix1,matrix2)){
             //
             //
             for(List<Decimal> rows : matrix1){
				 
                 
             }
             
         }
        
        return result;
    }

}