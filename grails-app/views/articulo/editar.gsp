<!DOCTYPE html>
<html>
<%@ page import="pucebuy.Categoria" %>
<head>
    <meta charset="UTF-8">
    <title>Editar Artículo</title>
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
        .form-card {
            max-width: 540px;
            width: 100%;
            margin: 30px auto 90px auto;
            background: #fff;
            border-radius: 15px;
            padding: 32px 28px 28px 28px;
            box-shadow: 0 2px 12px rgba(25, 118, 210, 0.07);
            box-sizing: border-box;
        }
        .form-card h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #1976d2;
            font-size: 1.3em;
            font-weight: 600;
        }
        .form-group {
            margin-bottom: 18px;
        }
        .form-group label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
            color: #1976d2;
        }
        .form-group input, .form-group select {
            width: 100%;
            box-sizing: border-box;
            padding: 10px 12px;
            border-radius: 8px;
            border: 1px solid #b0bec5;
            font-size: 15px;
            background: #f9f9f9;
            transition: border 0.2s;
        }
        .form-group input:focus, .form-group select:focus {
            border: 1.5px solid #1976d2;
            outline: none;
        }
        .btn-guardar {
            width: 100%;
            padding: 12px;
            background: #1976d2;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 10px;
            transition: background 0.2s;
        }
        .btn-guardar:hover {
            background: #1565c0;
        }
        .btn-cancelar {
            width: 100%;
            padding: 12px;
            background: #ccc;
            color: #333;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 10px;
            display: block;
            text-align: center;
            text-decoration: none;
            transition: background 0.2s;
        }
        .btn-cancelar:hover {
            background: #b0bec5;
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
            .form-card {
                max-width: 98vw;
                padding: 10px 4vw 18vw 4vw;
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