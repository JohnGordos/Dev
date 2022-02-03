public class ParkLocator {

    public static String[] country(String countryName){
        ParkService.ParksImplPort parkSearch = new ParkService.ParksImplPort();
        return parkSearch.byCountry(countryName);
    }
    
}