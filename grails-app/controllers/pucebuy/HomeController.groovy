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

    def buscarAjaxHtml() {
        def articulos = Articulo.list()
        if(params.q) {
            articulos = articulos.findAll { it.nombre?.toLowerCase()?.contains(params.q.toLowerCase()) }
        }
        def html = ""
        if(articulos && articulos.size() > 0) {
            articulos.each { art ->
                html += """
                <div class="card">
                    <a href="${createLink(controller:'articulo', action:'detalle', id: art.id)}" style="text-decoration:none; color:inherit;">
                        <img src="${art.imagen ?: resource(dir:'images', file:'producto.png')}" alt="${art.nombre}">
                        <p>${art.nombre}</p>
                        <p class='precio'>\$${art.precio}</p>
                    </a>
                </div>
                """
            }
        } else {
            html = "<div style='width:100%;text-align:center;color:#888;'>No se encontraron resultados.</div>"
        }
        render text: html, contentType: 'text/html'
    }
}

