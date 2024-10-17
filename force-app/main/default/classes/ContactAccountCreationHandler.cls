public class ContactAccountCreationHandler {
    
    public static void contacAccountCreation(List<Contact> conList){
        List<Account> accList = new List<Account>();
    
        	for(Contact con: conList){
            con.AccountId = null;
            Account acc = new Account();
                acc.Name = con.LastName;
                acc.Phone = con.MobilePhone;
                accList.add(acc);                      
        }
         insert conList;
    }
}