package pucebuy

class Mensaje {
    Usuario emisor
    Usuario receptor
    String contenido
    Date fecha

    static constraints = {
        emisor nullable: false
        receptor nullable: false
        contenido blank: false
        fecha nullable: false
    }
}
