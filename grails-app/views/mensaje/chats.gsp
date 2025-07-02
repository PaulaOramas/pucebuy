<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="none"/>
    <meta charset="UTF-8">
    <title>Mis chats</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Arial, sans-serif;
            background: #f4f6fb;
        }
        .top-banner {
            background: linear-gradient(90deg, #1976d2 60%, #42a5f5 100%);
            padding: 25px 0 15px 0;
            text-align: center;
            color: #fff;
            box-shadow: 0 2px 8px rgba(25, 118, 210, 0.08);
        }
        .top-banner img {
            width: 70px;
            margin-bottom: 10px;
        }
        .top-banner h3 {
            margin: 0;
            font-size: 1.5em;
            font-weight: 600;
            letter-spacing: 1px;
        }
        .chats-list {
            max-width: 400px;
            margin: 30px auto 90px auto;
            background: #fff;
            border-radius: 15px;
            padding: 24px 20px 20px 20px;
            box-shadow: 0 2px 12px rgba(25, 118, 210, 0.07);
        }
        .chats-list ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .chats-list li {
            margin-bottom: 15px;
            background: #e3eaf6;
            border-radius: 10px;
            padding: 12px;
            transition: background 0.2s;
        }
        .chats-list li:last-child {
            margin-bottom: 0;
        }
        .chats-list li:hover {
            background: #d0e7fa;
        }
        .chats-list a {
            text-decoration: none;
            color: #1976d2;
            font-weight: bold;
            font-size: 1.05em;
            display: block;
        }
        .bottom-nav {
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            background: #fff;
            display: flex;
            justify-content: space-around;
            border-top: 1.5px solid #b0bec5;
            padding: 16px 0 10px 0;
            z-index: 100;
            box-shadow: 0 -2px 16px rgba(25, 118, 210, 0.07);
            font-size: 1.18em;
        }
        .bottom-nav div, .bottom-nav a {
            text-align: center;
            font-size: 1.13em;
            color: #1976d2;
            font-weight: 600;
            line-height: 1.3;
            padding: 0 10px;
            transition: color 0.2s, background 0.2s;
            border-radius: 10px;
            min-width: 70px;
        }
        .bottom-nav .active, .bottom-nav a.active {
            color: #0d47a1;
            font-weight: bold;
            background: #e3eaf6;
        }
        .bottom-nav div:hover, .bottom-nav a:hover {
            background: #e3eaf6;
            color: #1565c0;
        }
        @media (max-width: 600px) {
            .chats-list {
                max-width: 98vw;
                padding: 10px 4vw 18vw 4vw;
            }
            .top-banner img {
                width: 50px;
            }
            .bottom-nav {
                font-size: 1em;
                padding: 10px 0 8px 0;
            }
            .bottom-nav div, .bottom-nav a {
                font-size: 1em;
                min-width: 50px;
                padding: 0 4px;
            }
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
