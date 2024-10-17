trigger AssociateContactDontDelete on Account (before delete) {

    List<Contact> conList = [Select id,AccountId FROM Contact WHERE AccountId IN : Trigger.oldMap.keyset()];

			for(Contact con : conList){

				//con.AccountId = Null;
			}
				update conList;
         }