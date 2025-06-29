package pucebuy

class Articulo {
    String nombre
    BigDecimal precio
    String estado
    String imagen
    Usuario usuario
    Categoria categoria

    static mapping = {
        table 'articulo'
        id column: 'id'
        version false
        nombre column: 'nombre'
        precio column: 'precio'
        estado column: 'estado'
        imagen column: 'imagen'
        usuario column: 'usuario_id'
        categoria column: 'categoria_id'
    }

    static constraints = {
        nombre blank: false, maxSize: 100
        precio nullable: false, scale: 2
        estado blank: false, maxSize: 3
        imagen nullable: true, maxSize: 255
        usuario nullable: false
        categoria nullable: false
    }
}
