package pucebuy

class Usuario {
    String nombre
    String apellido
    String email
    String contrasena
    String telefono
    String estado = "ACT"
    Date fechaCreacion = new Date()

    static constraints = {
        nombre blank: false
        apellido blank: false
        email email: true, blank: false, matches: /.+@puce\.edu\.ec/
        contrasena blank: false
        telefono nullable: true
        estado inList: ["ACT", "INA"]
    }
}
