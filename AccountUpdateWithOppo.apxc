/* Write a trigger on the Account when the Account is updated check all 
opportunities related to the account. Update all Opportunities Stage to 
close lost if an opportunity created date is greater than 30 days from today
 and stage not equal to close won. */
trigger AccountUpdateWithOppo on Account (after update) {
    set<Id> acctId = new set<Id> (); //Here we make a set of Id's.
    for(account ac : Trigger.new) {
        acctId.add(ac.Id); //Here we add Account Id into Trigger
    }
    Datetime dy = System.now() - 30; // Here we take the 30 days before from the current day.
    List<Opportunity> oppupdate = new List<Opportunity>();

    // Here we Extract the Data where our Opportunity Id is matched with Account Id
    List<Opportunity> opp = [Select Id, AccountId, StageName, CreatedDate, CloseDate From Opportunity Where AccountId In : acctId];
        if(opp.size()>0) { // Here we Check the size if it is not less then to 0.
            for(Opportunity ops : opp) {

                // Here we apply the condition is StageName is should not be 'Closed Won' and Created date is Should less then before 30 days.
                if(ops.CreatedDate<dy && ops.StageName!='Closed Won') {
                    
                    // Here we change Stage Name to Close Lost & CloseDate is Today Date.
                    ops.StageName = 'Close Lost';
                    ops.CloseDate = System.today();
                    oppupdate.add(ops);
                }
            }
        }
    if(oppupdate.size()>0) {
        update oppupdate;
    }

}