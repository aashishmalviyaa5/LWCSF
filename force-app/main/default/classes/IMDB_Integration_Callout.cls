public class IMDB_Integration_Callout {
    @AuraEnabled(cacheable=true)
    public static String getImdbInfo(String searchText){
        
        Http http = new Http();   
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://api.collectapi.com/imdb/imdbSearchByName?query='+searchText);
        request.setheader('authorization','apikey 7h5lejVgKu4I5MfnTlzw8O:7ftAa63jsBSl3LIO17CAKG');
        
        try{

        HttpResponse response = http.send(request);
        
        if(response.getStatusCode() == 200){
            
            String responseBody = response.getBody();
        	system.debug('Request successful' + responseBody);
            return responseBody;
        }
        else{
            String errorMessage = response.getStatus()+response.getStatusCode();
            system.debug('Unsuccessful Request' + errorMessage);
            return errorMessage;
         
     }
    }
        catch(Exception e){
            system.debug('Error message'+ e.getMessage());
            return e.getMessage();
        }
    }
}