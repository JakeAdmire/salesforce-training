public with sharing class ContactsTable {
    public contact[] contacts{get;private set;}
    public string firstName{get;set;}
    public string lastName{get;set;}

    // Make a constructor method with the same name as the class.
    public ContactsTable() {
        // This is a SOQL query.
        contacts = [SELECT id, name, accountId, email, phone, title FROM contact];
    }

    // 'public' tells us that this method is globally accessible.
    // 'void' tells us that it returns nothing.
    public void filterByName() {
        // You can also write SOQL queries in a string.
        string query = 'SELECT Id, Name, AccountId, Email, Phone, Title FROM Contact'; 
        query += filterString();
        // 'database' is a reserved word.
        contacts = database.query(query);
    }

    // 'string' tells us that it returns a string.
    public string filterString() {
        string output = '';
        // Add brackets to the end of a type to make it a list of that type.
        // 'string[]' is a list of strings.
        string[] filters = new string[] {};

        if (string.isNotBlank(firstName)) {
            // '.add()' is a list prototype like JavaScript's '.push()'.
            filters.add('FirstName = :firstName');
        }

        if (string.isNotBlank(lastName)) {
            filters.add('LastName = :lastName');
        }

        if (!filters.isEmpty()) {
           // '.join()' is a string prototype. 
            output += ' WHERE ' + string.join(filters, ' AND ');
        }

        return output;
    }
}
