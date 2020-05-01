public class utilities {
    public static void sendEmail(string recipient, string subject, string body) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        // type name = data
        String[] toAddresses = new list < String > ();
        toAddresses.add (recipient);
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        x
        Messaging.SingleEmailMessage[] messages = new Messaging.SingleEmailMessage[] { mail };
        Messaging.sendEmail(messages);
    }
    

}