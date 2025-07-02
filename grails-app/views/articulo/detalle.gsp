<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Detalle del Artículo</title>
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
        .detalle-card {
            max-width: 400px;
            margin: 30px auto 90px auto;
            background: #fff;
            border-radius: 15px;
            padding: 24px 20px 20px 20px;
            box-shadow: 0 2px 12px rgba(25, 118, 210, 0.07);
            text-align: center;
        }
        .detalle-card img {
            width: 100%;
            height: 210px;
            object-fit: cover;
            border-radius: 12px;
            margin-bottom: 15px;
            background: #e3eaf6;
        }
        .detalle-card h2 {
            margin: 10px 0 5px 0;
            font-size: 1.3em;
            font-weight: 600;
            color: #1976d2;
        }
        .detalle-card .precio {
            color: #2e7d32;
            font-weight: bold;
            font-size: 1.2em;
            margin-bottom: 8px;
        }
        .detalle-card .info {
            margin: 10px 0;
            color: #555;
            font-size: 1em;
        }
        .detalle-card .label {
            font-weight: bold;
            color: #1976d2;
        }
        .btn-chat {
            display: inline-block;
            margin-top: 15px;
            padding: 10px 22px;
            background: #1976d2;
            color: #fff;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            font-size: 1em;
            transition: background 0.2s;
        }
        .btn-chat:hover {
            background: #1565c0;
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
            padding: 16px 0 10px 0; /* más alto */
            z-index: 100;
            box-shadow: 0 -2px 16px rgba(25, 118, 210, 0.07);
            font-size: 1.18em; /* más grande */
        }
        .bottom-nav div, .bottom-nav a {
            text-align: center;
            font-size: 1.13em; /* más grande */
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
            .detalle-card {
                max-width: 98vw;
                padding: 10px 4vw 18vw 4vw;
            }
            .detalle-card img {
                height: 140px;
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
        <h3>Detalle del artículo</h3>
    </div>
    <div class="detalle-card">
        <img src="${articulo.imagen ?: resource(dir:'images', file:'producto.png')}" alt="${articulo.nombre}">
        <h2>${articulo.nombre}</h2>
        <div class="precio">$${articulo.precio}</div>
        <g:if test="${articulo.precio == 0}">
            <div style="color:#e67e22; font-weight:bold; margin-bottom:10px;">
                Este producto es para <span style="text-decoration:underline;">intercambio</span>, no venta.
            </div>
        </g:if>
        <div class="info"><span class="label">Estado:</span> ${articulo.estado}</div>
        <div class="info"><span class="label">Categoría:</span> ${articulo.categoria?.nombre}</div>
        <div class="info"><span class="label">Publicado por:</span> ${articulo.usuario?.nombre}</div>
        <g:link controller="mensaje" action="conversacion" id="${articulo.usuario?.id}" class="btn-chat" style="display:inline-block; margin-top:15px; padding:10px 20px; background:#4a90e2; color:#fff; border-radius:8px; text-decoration:none; font-weight:bold;">
            💬 Chatear con el dueño
        </g:link>
    </div>
    <div class="bottom-nav">
<div class="active">
        <g:link controller="home" action="inicio" style="text-decoration:none; color:inherit;">
            🏠<br>Inicio
        </g:link>
    </div>
    <div>
        <a href="${createLink(controller:'articulo', action:'publicar')}" style="text-decoration:none; color:inherit;">
            ➕<br>Publicar
        </a>
    </div>
    <div>
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