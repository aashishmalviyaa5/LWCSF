trigger ContactAccMandatoryfield on Contact (before insert, before update) {
    
      if((Trigger.isBefore) && ((Trigger.isInsert)||(Trigger.isUpdate))){

		for(Contact con: Trigger.new){
			if(con.AccountId == null){
			//con.AccountId.addError('Account is mandatory field');
			}
			
		}

	}
		
}