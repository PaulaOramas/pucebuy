package pucebuy

class ArtIntercambio {
    Articulo articulo
    Usuario receptor
    BigDecimal precio

    static constraints = {
        articulo nullable: false
        receptor nullable: false
        precio nullable: false, scale: 2
    }
}
