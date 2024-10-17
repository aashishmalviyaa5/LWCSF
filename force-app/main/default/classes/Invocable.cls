public with sharing class Invocable {

    // Define the input parameters
    public class Request {
        @InvocableVariable(required=true)
        public String accountId;
        
        @InvocableVariable(required=true)
        public String newPhone;
    }

    // Define the output parameters
    public class Response {
        @InvocableVariable
        public String message;
    }

    // Invocable method
    @InvocableMethod(label='Update Account Phone' description='Updates the phone number of the specified account')
    public static List<Response> updatePhoneNumber(List<Request> requests) {
        List<Response> responses = new List<Response>();
        
        for(Request req : requests) {
            Response res = new Response();
            try {
                // Retrieve the account
                Account acc = [SELECT Id, Phone FROM Account WHERE Id = :req.accountId LIMIT 1];
                
                // Update the phone number
                acc.Phone = req.newPhone;
                update acc;
                
                // Set response values
                res.message = 'Phone number updated successfully';
            } catch (Exception e) {
                res.message = 'Error: ' + e.getMessage();
            }
            responses.add(res);
        }
        
        return responses;
    }
}