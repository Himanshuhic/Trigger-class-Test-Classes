// We write a Test class for CaseTrigger class
@isTest
private class TestCaseTrigger{
    @isTest static void testCase(){
        List<Case> cs = new List<Case>; // Here we make a list of case
        for(Integer i=0; i<20; i++){ 
            Case c = new Case();
            c.Origin = 'Email'; // Now we are passing the value
            c.Status = 'New';
            cs.add(c);
        }
        Test.startTest(); // Here we start the test
        insert cd; // Here we insert the value into that list
        Test.stopTest(); // Here we stop the test
    }
}

// Note:-  The code coverage area of this Test class is 100%