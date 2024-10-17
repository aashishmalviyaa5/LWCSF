trigger contactDuplicate on Contact (before insert) {
    
    //if(Trigger.IsBefore && Trigger.Isinsert){

		for(Contact con : Trigger.new){
		
			integer count = [select count() from Contact where LastName =: con.LastName];
			
			if(count>0){
                
				//con.addError('Duplicate Contact');
				
				}
		}
}