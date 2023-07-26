trigger ContactUniqueEmail on Contact (before insert) {
	
    Set<String> emails = new Set<String>();
    for (Contact con : Trigger.new) {
        String email = con.Email;
        if (email != null && email.contains('@')) {
            String temp = email.substring(email.indexOf('@') + 1);
            emails.add(temp);
        }
    }
    Set<Id> accId = new Set<Id>();
    for (Contact contact : Trigger.new) {
        if (contact.AccountId != null) {
            accId.add(contact.AccountId);
        }
    }
    List<Account> acc = [SELECT Id, Description FROM Account WHERE Id IN :accId];
    for (Account account : acc) {
        String dsc = account.Description != null ? account.Description + '\n' : '';
        for (String domain : emails) {
            dsc += domain + '\n';
        }       
        account.Description = dsc;
    }   
    update acc;
}