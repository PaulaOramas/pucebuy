package pucebuy

class Categoria {
    String nombre

    static mapping = {
        table 'categoria'
        id column: 'cat_id'
        nombre column: 'cat_nombre'
        version false
    }

    static constraints = {
        nombre blank: false, maxSize: 50
    }

    String toString() {
        return nombre
    }
}
