// write Trigger code when case origin is 'Email' then mark status 'New' and priority 'Medium'
public class ApexCaseTrigger {
    public static void addcase(List<case> cs){ //Here we create List of case
        if(!cs.isEmpty()){ //Here we check if case is empty or not
            for(Case c : cs){
                if(c.Origin == 'Email') { //Here we make sure that Origin is Email 
                    c.Status = 'New';
                    c.Priority = 'Medium';
                }
            }
        }
    }

}

// ----------------------------: "Here its Trigger Class" :-----------------------------

// In this trigger we apply for the Before insert action
trigger TriggerCase on Case (before insert) {
    if(trigger.isBefore && trigger.isInsert) {
        ApexCaseTrigger.addcase(trigger.new);
    }

}

