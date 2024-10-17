public class AccountRatingHotHandlerClass {
    
    public static void ratingHot(List<Account> accList){
        List<Account> accountsToUpdate = new List<Account>();
        
        for(Account acc : accList){         
            if(acc.Industry == 'Banking' || acc.Industry == 'Healthcare'){
                acc.Rating = 'Hot';
                accountsToUpdate.add(acc);
            }
        }
    }
}