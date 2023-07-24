// Whenever New Account Record is created then needs to create associated Contact Record automatically.

trigger AcountWithContact on Account (before insert, after insert) {
    try{
        if(trigger.isBefore){ //Here we check record before trigger
            system.debug('Can not do');
        }
        else if(trigger.isAfter) { //Here we check record after trigger
            if(trigger.isInsert){
                 List<contact> con = new List<contact>(); //Here we create list of contacts
                for(Account acc :Trigger.new){
                    Contact cont = new Contact(); //now we create object and filed the data
                    cont.accountId = acc.Id;
                    cont.LastName = acc.Name;
                    con.add(cont);
                }
                insert con;
            }
        }
    }
    catch(DmlException e){ //Here we check any exception if it is occures
        system.debug('Error is:-' + e.getMessage());
    }

}
