<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="none"/>
    <meta charset="UTF-8">
    <title>Mis chats</title>
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
        .chats-list {
            max-width: 400px;
            margin: 30px auto 80px auto;
            background: #f9f9f9;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 0 10px #ddd;
        }
        .chats-list ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .chats-list li {
            margin-bottom: 15px;
            background: #e6f1fc;
            border-radius: 10px;
            padding: 12px;
            transition: background 0.2s;
        }
        .chats-list li:hover {
            background: #d0e7fa;
        }
        .chats-list a {
            text-decoration: none;
            color: #222;
            font-weight: bold;
            font-size: 1.05em;
            display: block;
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
        <h3>Chats con otros usuarios</h3>
    </div>
    <div class="chats-list">
        <ul>
            <g:each in="${receptores}" var="r">
                <li>
                    <g:link controller="mensaje" action="conversacion" params="[id: r.id]">
                        Chat con ${r.nombre} ${r.apellido}
                    </g:link>
                </li>
            </g:each>
            <g:if test="${!receptores || receptores.size() == 0}">
                <li style="color:#888;">No tienes conversaciones aún.</li>
            </g:if>
        </ul>
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
