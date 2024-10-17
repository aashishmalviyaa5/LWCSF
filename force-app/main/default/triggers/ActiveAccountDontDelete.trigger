trigger ActiveAccountDontDelete on Account (before delete) {
	
    		if(Trigger.IsBefore && Trigger.IsDelete){

			for(Account acc : Trigger.old){
			
				if(acc.Active__c == 'Yes'){
				//acc.addError('Active Account cannot be delete');
				
			}
		}
	}
}