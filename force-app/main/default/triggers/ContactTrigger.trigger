trigger ContactTrigger on Contact (after insert, after update, after delete) {
    // A map to hold the account Ids and their contact counts
    Map<Id, Integer> accountIdToContactCount = new Map<Id, Integer>();
    if (Trigger.isInsert || Trigger.isUpdate) {
        for (Contact contact : Trigger.new) {
            if (contact.AccountId != null) {
                if (!accountIdToContactCount.containsKey(contact.AccountId)) {
                    accountIdToContactCount.put(contact.AccountId, 0);
                }
                accountIdToContactCount.put(contact.AccountId, accountIdToContactCount.get(contact.AccountId) + 1);
            }   }   }
    // Process the records that are being deleted
    if (Trigger.isDelete) {
        for (Contact contact : Trigger.old) {
            if (contact.AccountId != null) {
                if (!accountIdToContactCount.containsKey(contact.AccountId)) {
                    accountIdToContactCount.put(contact.AccountId, 0);
                }
                accountIdToContactCount.put(contact.AccountId, accountIdToContactCount.get(contact.AccountId) - 1);
            }
        }
    }
    // Update the Account records with the new contact counts
    List<Account> accountsToUpdate = new List<Account>();
    for (Id accountId : accountIdToContactCount.keySet()) {
        Account acc = new Account(Id = accountId);
        acc.Total_Contacts__c = accountIdToContactCount.get(accountId);
        accountsToUpdate.add(acc);
    }
    // Perform the update
    if (!accountsToUpdate.isEmpty()) {
        update accountsToUpdate;
    }
}