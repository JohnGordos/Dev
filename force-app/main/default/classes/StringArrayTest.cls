public class StringArrayTest {

    public static List<string> generateStringArray(Integer i) {
        List<String> s = new List<String>();
        
        for(Integer n=0; n < i; n++){
            s.add('Test '+n);        
        }
        return s;
    }

}