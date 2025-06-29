package pucebuy

class CategoriaController {

    def list() {
        def categorias = Categoria.list(sort: 'nombre', order: 'asc')
        return [categorias: categorias]
    }

    def show_ajax() {
        def categoria = Categoria.get(params.id)
        if (!categoria) {
            render "ERROR*Categoría no encontrada"
            return
        }
        return [categoria: categoria]
    }

    def form_ajax() {
        def categoria = params.id ? Categoria.get(params.id) : new Categoria()
        return [categoria: categoria]
    }

    def save_ajax() {
        def categoria = params.id ? Categoria.get(params.id) : new Categoria()
        if (!categoria) {
            render "ERROR*Categoría no encontrada"
            return
        }

        categoria.properties = params

        if (!categoria.save(flush: true)) {
            render "ERROR*Error al guardar la categoría: ${categoria.errors.allErrors.join(', ')}"
            return
        }

        render "OK"
    }

    def delete_ajax() {
        def categoria = Categoria.get(params.id)
        if (!categoria) {
            render "ERROR*Categoría no encontrada"
            return
        }

        try {
            categoria.delete(flush: true)
            render "OK"
        } catch (Exception e) {
            render "ERROR*No se puede eliminar la categoría"
        }
    }

    def buscar_ajax() {
        def criterio = params.criterio?.trim()
        def categorias = Categoria.createCriteria().list {
            if (criterio) {
                ilike("nombre", "%${criterio}%")
            }
        }
        render(template: "tabla_ajax", model: [categorias: categorias])
    }
}
