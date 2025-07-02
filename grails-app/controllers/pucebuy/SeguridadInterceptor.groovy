package pucebuy


class SeguridadInterceptor {

    SeguridadInterceptor() {
        matchAll()
            .excludes(controller: 'login') // Permite login y registro
            .excludes(controller: 'registro') // Si tienes registro
    }

    boolean before() {
        if (!session.usuario) {
            redirect(controller: 'login', action: 'index')
            return false
        }
        true
    }

    boolean after() { true }

    void afterView() {
        // no-op
    }
}
