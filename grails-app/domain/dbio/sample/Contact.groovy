package dbio.sample

class Contact {

    static mapping = {
         table 'contact'
         id column:'id_contact'
         version false
    }
    String name
    String phone
    Date birthdate
    String sex
    
    static constraints = {
    }
}
