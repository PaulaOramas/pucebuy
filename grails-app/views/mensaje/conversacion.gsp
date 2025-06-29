<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="none"/>
    <meta charset="UTF-8">
    <title>Conversación</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #fafafa;
        }
        .top-banner {
            background-color: #e6f1fc;
            padding: 15px;
            text-align: center;
        }
        .top-banner img {
            width: 60px;
        }
        .top-banner h3 {
            margin-top: 10px;
        }
        .conversacion-card {
            max-width: 400px;
            margin: 30px auto 80px auto;
            background: #f9f9f9;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 0 10px #ddd;
        }
        .mensaje {
            margin-bottom: 15px;
            padding: 10px;
            border-radius: 10px;
            background: #e6f1fc;
            position: relative;
        }
        .mensaje.yo {
            background: #d0e7fa;
            text-align: right;
        }
        .mensaje .autor {
            font-weight: bold;
            color: #333;
        }
        .mensaje .fecha {
            font-size: 0.85em;
            color: #888;
            margin-top: 2px;
            display: block;
        }
        .form-mensaje {
            margin-top: 20px;
            text-align: center;
        }
        .form-mensaje textarea {
            width: 90%;
            border-radius: 8px;
            border: 1px solid #ccc;
            padding: 8px;
            font-size: 1em;
            resize: vertical;
        }
        .form-mensaje input[type="submit"] {
            margin-top: 8px;
            padding: 8px 20px;
            border-radius: 8px;
            border: none;
            background: #4a90e2;
            color: #fff;
            font-weight: bold;
            cursor: pointer;
        }
        .bottom-nav {
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            background: #f9f9f9;
            display: flex;
            justify-content: space-around;
            border-top: 1px solid #ddd;
            padding: 10px 0;
            z-index: 100;
        }
        .bottom-nav div, .bottom-nav a {
            text-align: center;
            font-size: 12px;
            color: #444;
        }
        .bottom-nav .active {
            color: black;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="top-banner">
        <img src="${resource(dir:'images', file:'logo.png')}" alt="logo">
        <h3>Conversación con ${otro.nombre} ${otro.apellido}</h3>
    </div>
    <div class="conversacion-card">
        <g:each in="${mensajes}" var="msg">
            <div class="mensaje ${msg.emisor?.id == session.usuario?.id ? 'yo' : ''}">
                <span class="autor">${msg.emisor?.id == session.usuario?.id ? 'Yo' : msg.emisor?.nombre}:</span>
                <span>${msg.contenido}</span>
                <span class="fecha">${msg.fecha?.format('dd/MM/yyyy HH:mm')}</span>
            </div>
        </g:each>
        <div class="form-mensaje">
            <g:form controller="mensaje" action="enviar">
                <input type="hidden" name="receptorId" value="${otro.id}"/>
                <textarea name="contenido" rows="3" placeholder="Escribe un mensaje..."></textarea><br>
                <input type="submit" value="Enviar"/>
            </g:form>
        </div>
    </div>
    <div class="bottom-nav">
        <div>
            <g:link controller="home" action="inicio" style="text-decoration:none; color:inherit;">
                🏠<br>Inicio
            </g:link>
        </div>
        <div>🛒<br>Marketplace</div>
        <div>
            <a href="${createLink(controller:'articulo', action:'publicar')}" style="text-decoration:none; color:inherit;">
                ➕<br>Publicar
            </a>
        </div>
        <div class="active">
            <g:link controller="mensaje" action="chats" style="text-decoration:none; color:inherit;">
                💬<br>Mensajes
            </g:link>
        </div>
        <div>
            <g:link controller="login" action="perfil" style="text-decoration:none; color:inherit;">
                👤<br>Perfil
            </g:link>
        </div>
    </div>
</body>
</html>
