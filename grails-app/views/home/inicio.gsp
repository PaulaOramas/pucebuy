<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="none"/>
    <meta charset="UTF-8">
    <title>Inicio - PuceBuy</title>
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

        .categorias {
            padding: 15px;
        }

        .categorias h4 {
            margin-bottom: 10px;
        }

        .categoria-icons {
            display: flex;
            gap: 20px;
            overflow-x: auto;
        }

        .categoria-icons img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 50%;
            border: 2px solid #ddd;
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

<%
    // Diccionario de imágenes por categoría
    def imagenesCategorias = [
        'Deportes': 'deportes.avif',
        'Ropa': 'ropa.jpg',
        'Electrónicos': 'electronicos.jpg',
        'Libros': 'libros.avif',
        'Juguetes': 'juguetes.avif',
        'Hogar': 'hogar.avif'
        // Agrega más categorías según necesites
    ]
%>

<!-- Encabezado -->
<div class="top-banner">
    <img src="${resource(dir:'images', file:'logo.png')}" alt="logo">
    <h3>Encuentra lo que necesitas en PuceBuy 🎯</h3>
</div>

<!-- Categorías -->
<div class="categorias">
    <h4>Categorías</h4>
    <div class="categoria-icons">
        <div style="text-align:center;">
            <a href="${createLink(controller:'home', action:'inicio')}">
                <img src="${resource(dir:'images', file:'categoria.png')}" alt="Todas" title="Todas">
                <div style="margin-top:5px; font-size:13px;">Todas</div>
            </a>
        </div>
        <g:each in="${categorias}" var="cat">
            <div style="text-align:center;">
                <a href="?categoria=${cat.id}">
                    <img src="${resource(dir:'images', file: imagenesCategorias[cat.nombre] ?: 'categoria.png')}" alt="${cat.nombre}" title="${cat.nombre}">
                    <div style="margin-top:5px; font-size:13px;">${cat.nombre}</div>
                </a>
            </div>
        </g:each>
    </div>
</div>

<!-- Publicaciones -->
<div class="categorias">
    <h4>Publicaciones</h4>
</div>
<div class="cards">
    <g:each in="${articulos}" var="art">
        <div class="card">
            <a href="${createLink(controller:'articulo', action:'detalle', id: art.id)}" style="text-decoration:none; color:inherit;">
                <img src="${art.imagen ?: resource(dir:'images', file:'producto.png')}" alt="${art.nombre}">
                <p>${art.nombre}</p>
                <p class="precio">$${art.precio}</p>
            </a>
        </div>
    </g:each>
</div>

<!-- Menú inferior -->
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
