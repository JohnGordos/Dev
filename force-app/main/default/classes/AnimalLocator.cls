public class AnimalLocator {
	
    public class ReturnedAnimal{
        Integer id;
        String name;
        String eats;
        String says;
    }
    
    public static String getAnimalNameById(Integer id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        system.debug('Raw response '+response.getbody());
        // Deserialize the JSON string into collections of primitive data types.
        Map<String,ReturnedAnimal> animals = (Map<String,ReturnedAnimal>) JSON.deserialize(response.getBody(),Map<String,ReturnedAnimal>.class);
        system.debug(animals.get('animal').says);
        return animals.get('animal').name;
    }
        
}