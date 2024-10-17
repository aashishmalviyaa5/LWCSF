public without sharing class AccGetAccountsClass {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(String SearchText) {
        if(String.isEmpty(SearchText)){

            return [Select id,name from Account];
        }
        else {
            SearchText = '%'+ SearchText +'%';
            return [Select id,name from Account where Name Like :SearchText];
        }
        
    }
}