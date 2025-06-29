package pucebuy

class HomeController {

    def inicio() {
        def categoriaId = params.categoria
        def articulos
        if (categoriaId) {
            articulos = Articulo.findAllByCategoria(Categoria.get(categoriaId as Long))
        } else {
            articulos = Articulo.list()
        }
        [articulos: articulos, categorias: Categoria.list()]
    }
}
 