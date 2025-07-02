<!DOCTYPE html>
<html>
<%@ page import="pucebuy.Categoria" %>
<head>
    <meta charset="UTF-8">
    <title>Editar Artículo</title>
    <style>
        body { margin: 0; font-family: Arial, sans-serif; background: #fafafa; }
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
        .form-card {
            max-width: 400px; margin: 30px auto 80px auto; background: #f9f9f9;
            border-radius: 15px; padding: 20px; box-shadow: 0 0 10px #ddd;
        }
        .form-card h2 { text-align: center; margin-bottom: 20px; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; font-weight: bold; }
        .form-group input, .form-group select {
            width: 100%; padding: 8px; border-radius: 6px; border: 1px solid #ccc;
        }
        .btn-guardar {
            width: 100%; padding: 10px; background: #1976d2; color: white;
            border: none; border-radius: 8px; font-size: 16px; font-weight: bold; cursor: pointer;
        }
        .btn-cancelar {
            width: 100%; padding: 10px; background: #ccc; color: #333;
            border: none; border-radius: 8px; font-size: 16px; font-weight: bold; cursor: pointer; margin-top: 10px;
            display: block; text-align: center; text-decoration: none;
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
        <h3>Editar Artículo</h3>
    </div>
    <div class="form-card">
        <h2>Editar Artículo</h2>
        <g:form controller="articulo" action="actualizar" method="post" onsubmit="return validarEditar();">
            <g:hiddenField name="id" value="${articulo.id}" />
            <div class="form-group">
                <label for="nombre">Nombre</label>
                <g:textField name="nombre" value="${articulo.nombre}" required="true" maxlength="100"/>
            </div>
            <div class="form-group">
                <label for="precio">Precio</label>
                <g:textField name="precio" value="${articulo.precio}" required="true" type="number" step="0.01"/>
            </div>
            <div class="form-group">
                <label for="estado">Estado</label>
                <g:select name="estado" from="${['USD','NVO','DEF']}" value="${articulo.estado}" required="true"/>
            </div>
            <div class="form-group">
                <label for="categoria">Categoría</label>
                <g:select name="categoria.id" from="${Categoria.list()}" optionKey="id" optionValue="nombre" value="${articulo.categoria?.id}" required="true"/>
            </div>
            <div class="form-group">
                <label for="imagen">URL de Imagen</label>
                <g:textField name="imagen" value="${articulo.imagen}" maxlength="255"/>
            </div>
            <button type="submit" class="btn-guardar">Guardar cambios</button>
        </g:form>
        <g:link controller="articulo" action="publicaciones" class="btn-cancelar">Cancelar</g:link>
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
    <script>
        function validarEditar() {
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
</body>
</html>