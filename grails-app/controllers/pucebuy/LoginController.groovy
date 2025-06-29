package pucebuy

class LoginController {

    /**
     * Muestra el formulario de login
     */
    def index() {
        render view: 'login'
    }

    /**
     * Procesa el login del usuario
     */
    def autenticar() {
        def email = params.email?.trim()
        def contrasena = params.contrasena?.trim()

        if (!email || !contrasena) {
            flash.message = "Completa todos los campos"
            render view: 'login'
            return
        }

        if (!email.toLowerCase().endsWith("@puce.edu.ec")) {
            flash.message = "El correo debe ser institucional (@puce.edu.ec)"
            render view: 'login'
            return
        }

        try {
            def usuario = Usuario.findByEmailAndContrasenaAndEstado(email, contrasena, 'ACT')

            if (usuario) {
                session.usuario = usuario
                redirect(controller: 'home', action: 'inicio')  // Asegúrate de tener HomeController.groovy con acción inicio
            } else {
                flash.message = "Credenciales inválidas"
                render view: 'login'
            }
        } catch (Exception e) {
            log.error("Error al autenticar usuario: ${e.message}", e)
            flash.message = "Error interno. Intenta más tarde."
            render view: 'login'
        }
    }

    /**
     * Cierra la sesión del usuario
     */
    def logout() {
        session.invalidate()
        redirect(action: "index")
    }

    def login() {
        def usuario = Usuario.findByEmailAndPassword(params.email, params.password)
        if (usuario) {
            session.usuario = usuario
            redirect(controller: 'home', action: 'inicio')
        } else {
            flash.message = "Credenciales incorrectas"
            redirect(action: 'login')
        }
    }

    def perfil() {
        def usuario = session.usuario
        if (!usuario) {
            flash.message = "Usuario no encontrado"
            redirect(controller: "home", action: "inicio")
            return
        }
        [usuario: usuario]
    }
}
