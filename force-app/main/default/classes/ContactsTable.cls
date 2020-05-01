public with sharing class ContactsTable {
    public contact[] contacts{get;private set;}
    public string firstName{get;set;}
    public string lastName{get;set;}

    public ContactsTable() { // constructor method
        contacts = [SELECT id, name, accountId, email, phone, title FROM contact];
    }

    public void filterByName() {
        string query = 'SELECT Id, Name, AccountId, Email, Phone, Title FROM Contact'; 
        query += filterString();
        contacts = database.query(query);
    }

    public string filterString() {
        string output = '';
        string[] filters = new string[] {};

        if (string.isNotBlank(firstName)) {
            filters.add('FirstName = :firstName');
        }

        if (string.isNotBlank(lastName)) {
            filters.add('LastName = :lastName');
        }

        if (!filters.isEmpty()) {
            output += ' WHERE ' + string.join(filters, ' AND ');
        }

        return output;
    }
}
