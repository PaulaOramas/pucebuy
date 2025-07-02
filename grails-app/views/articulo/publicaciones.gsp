<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="none"/>
    <meta charset="UTF-8">
    <title>Mis Publicaciones</title>
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
        .cards {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 15px;
            gap: 20px;
        }
        .card {
            width: 160px;
            background: #f9f5fc;
            border-radius: 15px;
            padding: 10px;
            text-align: center;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
        }
        .card img {
            width: 100%;
            height: 100px;
            object-fit: cover;
            border-radius: 12px;
        }
        .card p {
            margin: 8px 0 0;
        }
        .precio {
            color: green;
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
        .bottom-nav div {
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
    <!-- Encabezado -->
    <div class="top-banner">
        <img src="${resource(dir:'images', file:'logo.png')}" alt="logo">
        <h3>Mis Publicaciones</h3>
    </div>
    <div class="cards">
        <g:if test="${misArticulos?.size()}">
            <g:each in="${misArticulos}" var="art">
                <div class="card">
                    <a href="${createLink(controller:'articulo', action:'editarBorrar', id: art.id)}" style="text-decoration:none; color:inherit;">
                        <img src="${art.imagen ?: resource(dir:'images', file:'producto.png')}" alt="${art.nombre}">
                        <p>${art.nombre}</p>
                        <p class="precio">$${art.precio}</p>
                    </a>
                </div>
            </g:each>
        </g:if>
        <g:else>
            <p style="text-align:center; width:100%;">No tienes publicaciones aún.</p>
        </g:else>
    </div>
    <!-- Menú inferior -->
    <div class="bottom-nav">
        <div>
            <g:link controller="home" action="inicio" style="text-decoration:none; color:inherit;">
                🏠<br>Inicio
            </g:link>
        </div>
        <div class="active">
            🛒<br>Marketplace
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