trigger TaskCreation on Task (before insert, before update, after insert, after update) {
    
    if(Trigger.IsBefore && Trigger.IsUpdate){
   
       TaskCreationHandler.taskCreate(Trigger.new);
    }   
}