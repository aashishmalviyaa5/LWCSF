public class TaskCreationHandler {
    
    public static void taskCreate(List<Task> taskList){
         for(Task tk : taskList){
        
        	tk.Priority = 'High';
             taskList.add(tk);
    }     
  }
}