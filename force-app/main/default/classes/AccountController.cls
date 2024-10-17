public class AccountController {
    public Account newAccount { get; set; }

    // Constructor to initialize a new Account instance
    public AccountController() {
        newAccount = new Account();
    }

    // Method to save the new account record
    public PageReference saveAccount() {
        try {
            insert newAccount; // Insert the new account record
            // Redirect to a success page or refresh the current page
            return ApexPages.currentPage();
        } catch (Exception e) {
            // Handle any exceptions here
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Error saving account: ' + e.getMessage()));
            return null; // Stay on the current page
        }
    }
}