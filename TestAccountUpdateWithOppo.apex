// Here the Test Class of AccountUpdateWithOppo Trigger class
@isTest
private class TestAccountUpdateWithOppo {
    @isTest static void testupdate(){

        // Here we are insert the record into Account
        Account ac = new Account(Name='TestAccount');
        insert ac;

        // Here we are insert the record into Opportunity
        Opportunity op = new Opportunity(
        AccountId = ac.Id,
        Name = 'TestingOppotunity',
        StageName = 'Qualification',
        CloseDate = Date.today());
        insert op;

        // Here we Take the 30 days before current datc 
       Datetime dt = Date.today() - 30;
        Test.startTest();
        ac.Name='UpdateTestAccount';
        update ac;
        Test.stopTest();

        // Here we are Fetching Record from  the Opportunity.
        List<Opportunity> op1 = [SELECT Id, Name, StageName, CloseDate FROM Opportunity WHERE AccountId =: ac.Id];
        System.assertEquals(5,op1.size(),'define the size'); 
    
        for(Opportunity op2 :op1){
            try {

                // Here we are Match the condition
                if(op2.CreatedDate<dt && op2.StageName!='Closed Won') {
                System.assertEquals('Close Lost', op2.StageName,'convert closed won into close lost');
                System.assertEquals(Date.today(),op2.CloseDate,'campare the date');
            }
            else {
                System.assertEquals('Closed Lost', op2.StageName,'Change the stageame into closed lost');
            }
                
            }
            catch(Exception E) {
                System.debug('The Error is:- ' + E);
            }
            
        }
      
    }
}

// Note Its code covrage is 71% and try to reach <=90%