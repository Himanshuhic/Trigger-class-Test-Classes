@isTest
public class TestAcountWithContact {
    @isTest static void testBeforeInsert() {
        // Test data setup
        List<Account> testacc = new List<Account>{
            new Account(Name = 'Test Account1')};
 
        // Insert accounts  before insert event
        Test.startTest();
        try {
            insert testacc;
        } catch (Exception e) {
            // Verify that the trigger does not perform any DML operation in before insert
            System.assertEquals(null, [SELECT Id FROM Contact]);
        }
        Test.stopTest();
    }

    @isTest static void testAfterInsert() {
        // Test data setup
        List<Account> testacc = new List<Account>{
            new Account(Name = 'Test Account 1')};

        // Insert accounts  after insert event
        Test.startTest();
        insert testacc;
        Test.stopTest();

        // Verify that contacts are created with the same Last Name as the Account Name
        List<Contact> contacts = [SELECT Id, LastName, AccountId FROM Contact WHERE AccountId IN :testacc];
        System.assertEquals(testacc.size(), contacts.size());
        for (Integer i = 0; i < testacc.size(); i++) {
            System.assertEquals(testacc[i].Name, contacts[i].LastName);
            System.assertEquals(testacc[i].Id, contacts[i].AccountId);
        }
    }
}

//Note The Code Covrage of this Class is "91%"