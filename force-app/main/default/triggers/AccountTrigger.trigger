trigger AccountTrigger on Account (before insert,before update, After Insert,after update,before delete,after delete, after undelete) {

    if(Trigger.isBefore) {
        if((Trigger.isInsert) || (Trigger.isUpdate)){
               AccountRatingHotHandlerClass.ratingHot(trigger.new);        						    
    }  
    }
    if((Trigger.isAfter) && ((Trigger.isInsert) || (Trigger.isUpdate)|| (Trigger.IsDelete) || (Trigger.IsUnDelete))){
      	//ContactAccountCreationHandler.contacAccountCreation(Trigger.new);
    }
}