// Write Trigger class to Convert Lead When LeadSource is 'Web'
trigger LeadConvertedToWeb on Lead (before insert) { // This trigger execute before the Insert the lead
    List<Database.LeadConvert> lcon = new List<Database.LeadConvert>();
    for(Lead ld: Trigger.new){

        // Here we check the condition if Lead Source value is 'Web' or not
        if(ld.LeadSource == 'web'){
            Database.LeadConvert lc = new Database.LeadConvert();
            lc.setLeadId(ld.Id);
            lc.setConvertedStatus('Qualification');

            // Here We add Lead converted data into List
            lcon.add(lc);
        }
    }

    // Here we check is Lead Record empty or not
    if(!lcon.isEmpty()){
        List<Database.LeadConvertResult> lconrslt = new List<Database.LeadConvertResult>();
        
        // Here we check that our Lead Convert result is done successfully or not
        for(Database.LeadConvertResult rslt : lconrslt){
            if(!rslt.isSuccess()){
                System.debug(rslt.getErrors());
            }
        }
    }	

}