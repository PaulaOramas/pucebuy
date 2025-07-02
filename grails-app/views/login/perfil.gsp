<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Perfil de usuario</title>
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
        .usuario-card {
            max-width: 400px;
            margin: 30px auto 90px auto;
            background: #fff;
            border-radius: 15px;
            padding: 28px 22px 22px 22px;
            box-shadow: 0 2px 12px rgba(25, 118, 210, 0.07);
            text-align: center;
        }
        .usuario-card img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 50%;
            margin-bottom: 15px;
            border: 2px solid #e3eaf6;
            background: #e3eaf6;
        }
        .usuario-card h2 {
            margin: 10px 0 5px 0;
            color: #1976d2;
            font-size: 1.3em;
            font-weight: 600;
        }
        .usuario-card .info {
            margin: 10px 0;
            color: #555;
            font-size: 1em;
        }
        .usuario-card .label {
            font-weight: bold;
            color: #1976d2;
        }
        .usuario-card a,
        .usuario-card .g-link {
            display: inline-block;
            padding: 10px 20px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            margin-top: 15px;
            font-size: 1em;
            transition: background 0.2s;
        }
        .usuario-card a {
            background: #1976d2;
            color: #fff;
        }
        .usuario-card a:hover {
            background: #1565c0;
        }
        .usuario-card .g-link {
            background: #e53935;
            color: #fff;
            margin-top: 10px;
        }
        .usuario-card .g-link:hover {
            background: #b71c1c;
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
            .usuario-card {
                max-width: 98vw;
                padding: 10px 4vw 18vw 4vw;
            }
            .top-banner img {
                width: 50px;
            }
            .usuario-card img {
                width: 70px;
                height: 70px;
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
        <h3>Perfil de usuario</h3>
    </div>
    <div class="usuario-card">
        <img src="${resource(dir:'images', file:'perfil.webp')}" alt="${usuario.nombre}">
        <h2>${usuario.nombre}</h2>
        <div class="info"><span class="label">Email:</span> ${usuario.email}</div>
        <div class="info"><span class="label">Teléfono:</span> ${usuario.telefono}</div>
        <!-- Agrega más campos si tu dominio Usuario los tiene -->
        <div style="margin-top:20px;">
            <a href="${createLink(controller:'articulo', action:'publicaciones')}" 
               style="display:inline-block; padding:10px 20px; background:#1976d2; color:white; border-radius:8px; text-decoration:none; font-weight:bold;">
                Ver mis publicaciones
            </a>
        </div>
        <div style="margin-top:15px;">
            <g:link controller="login" action="logout"
                style="display:inline-block; padding:10px 20px; background:#e53935; color:white; border-radius:8px; text-decoration:none; font-weight:bold;">
                Cerrar sesión
            </g:link>
        </div>
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