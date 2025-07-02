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
        [categorias: Categoria.list()]
    }

    def save() {
        if (!session.usuario) {
            flash.message = "Debes iniciar sesión para publicar."
            redirect(controller: "login", action: "index")
            return
        }

        def articulo = new Articulo()
        articulo.nombre = params.nombre
        articulo.precio = params.precio as BigDecimal
        articulo.estado = params.estado
        articulo.imagen = params.imagen
        articulo.usuario = session.usuario
        articulo.categoria = Categoria.get(params['categoria.id'] as Long)

        if (articulo.save(flush: true)) {
            flash.message = "Artículo publicado correctamente."
            redirect(controller: "articulo", action: "publicar")
        } else {
            // Muestra los errores en la vista
            render(view: "publicar", model: [articulo: articulo, categorias: Categoria.list(), errores: articulo.errors])
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

    def publicaciones() {
        def usuario = session.usuario // o usa springSecurityService.currentUser
        def misArticulos = Articulo.findAllByUsuario(usuario)
        [misArticulos: misArticulos]
    }

    def detallePropio(Long id) {
        def articulo = Articulo.get(id)
        def usuario = session.usuario // o usa springSecurityService.currentUser
        if (!articulo || articulo.usuario?.id != usuario?.id) {
            flash.message = "No tienes permiso para ver este artículo."
            redirect(controller: 'home', action: 'inicio')
            return
        }
        [articulo: articulo]
    }

    def editar(Long id) {
        def articulo = Articulo.get(id)
        def usuario = session.usuario
        if (!articulo || articulo.usuario?.id != usuario?.id) {
            flash.message = "No tienes permiso para editar este artículo."
            redirect(controller: 'home', action: 'inicio')
            return
        }
        [articulo: articulo]
    }

    def actualizar(Long id) {
        def articulo = Articulo.get(id)
        def usuario = session.usuario
        if (!articulo || articulo.usuario?.id != usuario?.id) {
            flash.message = "No tienes permiso para editar este artículo."
            redirect(controller: 'home', action: 'inicio')
            return
        }
        articulo.properties = params
        if (articulo.save(flush: true)) {
            flash.message = "Artículo actualizado correctamente."
            // Cambia esta línea:
            redirect(action: 'editarBorrar', id: articulo.id)
        } else {
            render(view: 'editar', model: [articulo: articulo])
        }
    }

    def borrar() {
        def articulo = Articulo.get(params.id)
        def usuario = session.usuario
        if (!articulo || articulo.usuario?.id != usuario?.id) {
            flash.message = "No tienes permiso para borrar este artículo."
            redirect(controller: 'home', action: 'inicio')
            return
        }
        articulo.delete(flush: true)
        flash.message = "Artículo borrado correctamente."
        redirect(controller: 'articulo', action: 'publicaciones')
    }

    def editarBorrar(Long id) {
        def articulo = Articulo.get(id)
        def usuario = session.usuario // o usa springSecurityService.currentUser si usas Spring Security
        if (!articulo || articulo.usuario?.id != usuario?.id) {
            flash.message = "No tienes permiso para ver este artículo."
            redirect(controller: 'articulo', action: 'publicaciones')
            return
        }
        [articulo: articulo]
    }
}
