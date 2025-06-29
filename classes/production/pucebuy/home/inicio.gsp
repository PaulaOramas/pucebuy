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

<!-- Encabezado -->
<div class="top-banner">
    <img src="${resource(dir:'images', file:'logo.png')}" alt="logo">
    <h3>Encuentra lo que necesitas en PuceBuy 🎯</h3>
</div>

<!-- Categorías -->
<div class="categorias">
    <h4>Categorías</h4>
    <div class="categoria-icons">
        <div><img src="${resource(dir:'images', file:'categoria4.png')}" alt="Libros"></div>
        <div><img src="${resource(dir:'images', file:'categoria.png')}" alt="Ropa"></div>
        <div><img src="${resource(dir:'images', file:'categoria2.png')}" alt="Electrónica"></div>
        <div><img src="${resource(dir:'images', file:'categoria3.png')}" alt="Arte"></div>
    </div>
</div>

<!-- Publicaciones -->
<div class="categorias">
    <h4>Publicaciones</h4>
</div>
<div class="cards">
    <div class="card">
        <img src="${resource(dir:'images', file:'mantel.png')}" alt="Mantel">
        <p>Mantel</p>
        <p class="precio">$10.99</p>
    </div>
    <div class="card">
        <img src="${resource(dir:'images', file:'aretes.png')}" alt="Aretes">
        <p>Aretes</p>
        <p class="precio">$10.99</p>
    </div>
</div>

<!-- Menú inferior -->
<div class="bottom-nav">
    <div class="active">🏠<br>Inicio</div>
    <div>🛒<br>Marketplace</div>
    <div>➕<br>Publicar</div>
    <div>💬<br>Mensajes</div>
    <div>👤<br>Perfil</div>
</div>

</body>
</html>

