<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Detalle del Artículo</title>
    <style>
        body { margin: 0; font-family: Arial, sans-serif; background: #fafafa; }
        .top-banner { background-color: #e6f1fc; padding: 15px; text-align: center; }
        .top-banner img { width: 60px; }
        .detalle-card {
            max-width: 400px; margin: 30px auto; background: #f9f9f9;
            border-radius: 15px; padding: 20px; box-shadow: 0 0 10px #ddd; text-align: center;
        }
        .detalle-card img {
            width: 100%; height: 200px; object-fit: cover; border-radius: 12px; margin-bottom: 15px;
        }
        .detalle-card h2 { margin: 10px 0 5px 0; }
        .detalle-card .precio { color: green; font-weight: bold; margin: 10px 0; }
        .detalle-card .info { margin: 10px 0; color: #555; }
        .detalle-card .label { font-weight: bold; }
        .btn-editar, .btn-borrar {
            display:inline-block; padding:10px 20px; border-radius:8px; text-decoration:none; font-weight:bold; margin: 10px 5px 0 5px;
        }
        .btn-editar { background:#ffc107; color:#222; }
        .btn-borrar { background:#e53935; color:white; border:none; cursor:pointer; }
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
        <h3>Detalle del artículo</h3>
    </div>
    <div class="detalle-card">
        <img src="${articulo.imagen ?: resource(dir:'images', file:'producto.png')}" alt="${articulo.nombre}">
        <h2>${articulo.nombre}</h2>
        <div class="precio">$${articulo.precio}</div>
        <div class="info"><span class="label">Estado:</span> ${articulo.estado}</div>
        <div class="info"><span class="label">Categoría:</span> ${articulo.categoria?.nombre}</div>
        <div class="info"><span class="label">Vendedor:</span> Tú</div>
        <div>
            <a href="${createLink(controller:'articulo', action:'editar', id:articulo.id)}" class="btn-editar">Editar</a>
            <g:form controller="articulo" action="borrar" method="post" style="display:inline;">
                <g:hiddenField name="id" value="${articulo.id}"/>
                <button type="submit" class="btn-borrar" onclick="return confirm('¿Seguro que deseas borrar este artículo?');">Borrar</button>
            </g:form>
        </div>
    </div>
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