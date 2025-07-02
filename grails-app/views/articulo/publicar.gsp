<!-- filepath: grails-app/views/articulo/crear.gsp -->
<!DOCTYPE html>
<html>
<%@ page import="pucebuy.Categoria" %>
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

        form {
            max-width: 400px;
            margin: 30px auto 80px auto;
            background: #f9f9f9;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 0 10px #ddd;
        }
        label { display: block; margin-top: 10px; }
        input, select { width: 100%; padding: 8px; margin-top: 4px; border-radius: 6px; border: 1px solid #ccc; }
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
    <script>
        function validarFormulario() {
            var nombre = document.getElementsByName('nombre')[0].value.trim();
            var precio = document.getElementsByName('precio')[0].value.trim();
            var estado = document.getElementsByName('estado')[0].value.trim();
            var categoria = document.getElementsByName('categoria.id')[0].value.trim();
            if (!nombre || !precio || !estado || !categoria) {
                alert('Por favor, completa todos los campos obligatorios.');
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="top-banner">
        <img src="${resource(dir:'images', file:'logo.png')}" alt="logo">
        <h3>Publicar un artículo en PuceBuy</h3>
    </div>
    <h2 style="text-align:center;">Publicar Artículo</h2>

    <g:if test="${flash.message}">
        <div style="background:#d4edda; color:#155724; border:1px solid #c3e6cb; padding:10px; border-radius:8px; margin-bottom:15px; text-align:center;">
            ${flash.message}
        </div>
    </g:if>
    <g:if test="${errores}">
        <div style="background:#f8d7da; color:#721c24; border:1px solid #f5c6cb; padding:10px; border-radius:8px; margin-bottom:15px;">
            <ul>
                <g:each in="${errores.allErrors}" var="e">
                    <li><g:message error="${e}"/></li>
                </g:each>
            </ul>
        </div>
    </g:if>

    <g:form controller="articulo" action="save" method="post" onsubmit="return validarFormulario();">
        <label for="nombre">Nombre</label>
        <g:textField name="nombre" required="true" maxlength="100"/>

        <label for="precio">Precio *Si es intercambio poner 0.00</label>
        <g:textField name="precio" type="number" step="0.01" required="true"/>

        <label for="estado">Estado</label>
        <g:select name="estado"
                  from="${['USD', 'NVO', 'DEF']}"
                  required="true" />

        <label for="imagen">Imagen (URL de Cloudinary)</label>
        <g:textField name="imagen" maxlength="255"/>

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