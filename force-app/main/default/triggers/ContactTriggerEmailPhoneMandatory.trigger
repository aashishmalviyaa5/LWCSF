trigger ContactTriggerEmailPhoneMandatory on Contact (before insert, before update ) {
    if((Trigger.isBefore) && ((Trigger.isInsert) || (Trigger.isUpdate))){
           //List<Contact> conList = new List<Contact>();
                for(Contact con : Trigger.new){
                    if(con.Email == null || con.Email ==''){
                         //con.Phone.addError('Email is mandatory');
                    } 
                    if(con.Phone == null || con.Phone ==''){
                        //con.Phone.addError('Phone is mandatory');
                    }
                      
                   
                   }
         }
}