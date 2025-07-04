package pucebuy

class MensajeController {

    def chats() {
        def usuario = session.usuario
        // Consulta todos los usuarios con los que el usuario ha tenido conversación
        def receptores = Mensaje.createCriteria().list {
            or {
                eq("emisor", usuario)
                eq("receptor", usuario)
            }
            projections {
                property("emisor")
                property("receptor")
            }
        }.flatten().unique().findAll { it.id != usuario.id }
        [receptores: receptores]
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
