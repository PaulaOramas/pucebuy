<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Detalle del Usuario</title>
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
        .usuario-card {
            max-width: 400px;
            margin: 30px auto;
            background: #f9f9f9;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 0 10px #ddd;
            text-align: center;
        }
        .usuario-card img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 50%;
            margin-bottom: 15px;
            border: 2px solid #ddd;
        }
        .usuario-card h2 {
            margin: 10px 0 5px 0;
        }
        .usuario-card .info {
            margin: 10px 0;
            color: #555;
        }
        .usuario-card .label {
            font-weight: bold;
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
        <h3>Perfil de usuario</h3>
    </div>
    <div class="usuario-card">
        <img src="${resource(dir:'images', file:'perfil.webp')}" alt="${usuario.nombre}">
        <h2>${usuario.nombre}</h2>
        <div class="info"><span class="label">Email:</span> ${usuario.email}</div>
        <div class="info"><span class="label">Teléfono:</span> ${usuario.telefono}</div>
        <!-- Agrega más campos si tu dominio Usuario los tiene -->
    </div>
    <div class="bottom-nav">
<div class="active">
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