// This is the Test class of 'LeadConvertedToWeb' Trigger class
@isTest
public class TestLeadConvertedToWeb {
    @isTest static void testleadtoweb(){

        // Here we make a list of Lead and filled data into the record.
        List<Lead> led = new List<Lead>();
       Lead ld = new Lead(
       FirstName='Lead',
       LastName='Test',
       LeadSource='web');
        led.add(ld);
        insert led; // Here we insert the record into the List of lead.
        
        // From here our Test is Actually begins.
        Test.startTest();
        List<Database.LeadConvert> lcon = new List<Database.LeadConvert>();
        for(Lead lad :led) {

            // Here we add the lead status into the LeadConvert
            Database.LeadConvert ledcon = new Database.LeadConvert();
            ledcon.setLeadId(lad.Id);
            ledcon.setConvertedStatus('Qualification');
            lcon.add(ledcon);
        }
        List<Database.LeadConvertResult> conrslt = Database.convertLead(lcon);
        Test.stopTest();  // From here our Test is Actually end.
        for(Database.LeadConvertResult ledconrlt : conrslt){
            System.assert(ledconrlt.isSuccess(),''+ledconrlt.getLeadId());
            
        }
    }

}

// Note: The code coverage area of this test class is 91%
