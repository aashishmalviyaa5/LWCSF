trigger AccountRollUpSummary on Contact (after insert, after update,after delete, after undelete) {
Set<Id> accIds = new Set<Id>();

if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUndelete)){
        for(Contact con : Trigger.new){
            accIds.add(con.AccountId);
        }
    }
    if(Trigger.isAfter && Trigger.isUpdate ){
        Map<id,Contact> oldMap = new Map<id,Contact>();
        for(Contact con : Trigger.new){
            if(con.AccountId != trigger.oldMap.get(con.id).AccountId){
                accIds.add(con.AccountId);
            }  
        }
    }
    if(Trigger.isdelete){
        for(Contact con : Trigger.old){
            accIds.add(con.AccountId);
        }
    }

    if(!accIds.isEmpty()){
        List<Account> accountToUpdate = new List<Account>();
        List<Contact> numberofcontacts = [Select id,name from Contact Where AccountId IN : accIds];
        for(Id accId : accIds){       
            Account ac = new Account(id = accId);
            ac.Number_Of_Contacts__c = numberofcontacts.size();
            accountToUpdate.add(ac);
        }
    }
}