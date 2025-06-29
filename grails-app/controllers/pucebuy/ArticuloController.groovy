package pucebuy

class ArticuloController {

    def list() {
        def articulos = Articulo.list(sort: 'id', order: 'desc')
        return [articulos: articulos]
    }

    def show_ajax() {
        def articulo = Articulo.get(params.id)
        if (!articulo) {
            render "ERROR*Artículo no encontrado"
            return
        }
        return [articulo: articulo]
    }

    def form_ajax() {
        def articulo = params.id ? Articulo.get(params.id) : new Articulo()
        def categorias = Categoria.list(sort: 'nombre', order: 'asc')
        return [articulo: articulo, categorias: categorias]
    }

    def save_ajax() {
        def articulo = params.id ? Articulo.get(params.id) : new Articulo()
        if (!articulo) {
            render "ERROR*Artículo no encontrado"
            return
        }

        articulo.properties = params
        articulo.usuario = session.usuario  // Asegúrate de que el usuario esté en sesión

        if (!articulo.save(flush: true)) {
            render "ERROR*Error al guardar el artículo: ${articulo.errors.allErrors.join(', ')}"
            return
        }

        render "OK"
    }

    def delete_ajax() {
        def articulo = Articulo.get(params.id)
        if (!articulo) {
            render "ERROR*Artículo no encontrado"
            return
        }

        try {
            articulo.delete(flush: true)
            render "OK"
        } catch (Exception e) {
            render "ERROR*No se puede eliminar el artículo"
        }
    }

    def buscar_ajax() {
        def criterio = params.criterio?.trim()
        def articulos = Articulo.createCriteria().list {
            if (criterio) {
                or {
                    ilike("estado", "%${criterio}%")
                    categoria {
                        ilike("nombre", "%${criterio}%")
                    }
                }
            }
        }
        render(template: "tabla_ajax", model: [articulos: articulos])
    }

    def publicar() {
        [usuarios: Usuario.list(), categorias: Categoria.list()]
    }

    def save() {
        def articulo = new Articulo()
        articulo.nombre = params.nombre
        articulo.precio = params.precio as BigDecimal
        articulo.estado = params.estado
        articulo.imagen = params.imagen
        articulo.usuario = Usuario.get(params['usuario.id'] as Long)
        articulo.categoria = Categoria.get(params['categoria.id'] as Long)

        if (articulo.save(flush: true)) {
            flash.message = "Artículo publicado correctamente"
            redirect(controller: "home", action: "inicio")
        } else {
            flash.message = "Error al publicar el artículo"
            render(view: "publicar", model: [articulo: articulo, usuarios: Usuario.list(), categorias: Categoria.list()])
        }
    }

    def detalle(Long id) {
        def articulo = Articulo.get(id)
        if (!articulo) {
            flash.message = "Artículo no encontrado"
            redirect(controller: "home", action: "inicio")
            return
        }
        [articulo: articulo]
    }
}
