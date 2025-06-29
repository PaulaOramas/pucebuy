<!-- filepath: grails-app/views/articulo/crear.gsp -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Publicar Artículo</title>
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

        form {
            max-width: 400px;
            margin: 30px auto;
            background: #f9f9f9;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 0 10px #ddd;
        }
        label { display: block; margin-top: 10px; }
        input, select { width: 100%; padding: 8px; margin-top: 4px; }
        button { margin-top: 15px; width: 100%; }

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
        <h3>Publicar un artículo en PuceBuy</h3>
    </div>
    <h2 style="text-align:center;">Publicar Artículo</h2>
    <g:form controller="articulo" action="save" method="post">
        <label for="nombre">Nombre</label>
        <g:textField name="nombre" required="true" maxlength="100"/>

        <label for="precio">Precio</label>
        <g:textField name="precio" type="number" step="0.01" required="true"/>

        <label for="estado">Estado</label>
        <g:select name="estado" from="${['NVO', 'USD', 'DEF']}" keys="${['NVO', 'USD', 'DEF']}" required="true" />

        <label for="imagen">Imagen (URL de Cloudinary)</label>
        <g:textField name="imagen" maxlength="255"/>

        <label for="usuario.id">Usuario</label>
        <g:select name="usuario.id" from="${usuarios}" optionKey="id" optionValue="nombre" required="true"/>

        <label for="categoria.id">Categoría</label>
        <g:select name="categoria.id" from="${categorias}" optionKey="id" optionValue="nombre" required="true"/>

        <button type="submit">Publicar</button>
    </g:form>

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