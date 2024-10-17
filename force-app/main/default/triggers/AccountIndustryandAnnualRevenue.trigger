trigger AccountIndustryandAnnualRevenue on Account (before insert) {
    
    List<Account> accList = new List<Account>();

	if(Trigger.isInsert && Trigger.isBefore){

	for(Account acc : Trigger.new){
		if(acc.Industry == 'Banking'){
            //acc.AnnualRevenue = 5000000;
        }
		if(acc.Industry == 'Finance'){
            //acc.AnnualRevenue = 4000000;
        }
		if(acc.Industry == 'Insurance'){
           // acc.AnnualRevenue = 3500000;
        }
		if(acc.Industry == 'Healthcare'){
            //acc.AnnualRevenue = 2500000;
        }
		accList.add(acc);
		}  
    }
}