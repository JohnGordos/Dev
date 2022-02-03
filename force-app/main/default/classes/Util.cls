public class Util {

    public static List<String> getpicklists(String obj, String field){
        List<String> Objects = new List<String>{obj};
        List<Schema.DescribeSObjectResult> results = Schema.DescribeSobjects(Objects);
        List<String> values = new List<String>();
        for(Schema.DescribeSObjectResult res : results){
            for(Schema.PicklistEntry picklistvalue :res.fields.getmap().get(field).getdescribe().getpicklistvalues()){
                
                if(picklistvalue.isactive()) values.add(picklistvalue.getvalue());
                
            }
            
        }
        return values;
        
    }
    
}