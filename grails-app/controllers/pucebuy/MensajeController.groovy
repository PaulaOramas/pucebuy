package pucebuy

class MensajeController {

    def chats() {
        def usuario = session.usuario
        if (!usuario) {
            flash.message = "Debes iniciar sesión"
            redirect(controller: 'login', action: 'index')
            return
        }

        // Buscar todos los mensajes donde el usuario es emisor o receptor
        def mensajes = Mensaje.createCriteria().list {
            or {
                eq("emisor", usuario)
                eq("receptor", usuario)
            }
        }

        // Obtener todos los usuarios con los que ha conversado (distintos a sí mismo)
        def usuariosConversados = mensajes.collect {
            it.emisor == usuario ? it.receptor : it.emisor
        }.findAll { it != usuario }.unique()

        [receptores: usuariosConversados]
    }

    def conversacion() {
        def usuario = session.usuario
        def receptor = Usuario.get(params.id)

        if (!usuario || !receptor) {
            flash.message = "Datos incompletos"
            redirect(action: 'chats')
            return
        }

        // Todos los mensajes entre ambos usuarios (ida y vuelta)
        def mensajes = Mensaje.createCriteria().list {
            or {
                and {
                    eq("emisor", usuario)
                    eq("receptor", receptor)
                }
                and {
                    eq("emisor", receptor)
                    eq("receptor", usuario)
                }
            }
            order("fecha", "asc")
        }

        [mensajes: mensajes, otro: receptor]
    }

    def enviar() {
        def usuario = session.usuario
        def receptor = Usuario.get(params.receptorId)
        def contenido = params.contenido?.trim()

        if (!usuario || !receptor || !contenido) {
            flash.message = "Mensaje no válido"
            redirect(action: 'chats')
            return
        }

        def mensaje = new Mensaje(
            emisor: usuario,
            receptor: receptor,
            contenido: contenido,
            fecha: new Date()
        )
        if (mensaje.save(flush: true)) {
            redirect(action: 'conversacion', params: [id: receptor.id])
        } else {
            flash.message = "Error al enviar el mensaje"
            redirect(action: 'chats')
        }
    }
}
