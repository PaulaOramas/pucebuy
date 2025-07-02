<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="none"/>
    <meta charset="UTF-8">
    <title>Mis Publicaciones</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Arial, sans-serif;
            background: #f4f6fb;
            min-height: 100vh;
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
        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 4px;
            padding: 4px;
            margin-bottom: 40px;
            justify-items: center;
        }
        .card {
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 2px 12px rgba(25, 118, 210, 0.07);
            width: 190px;
            height: 230px;
            padding: 0;
            text-align: center;
            transition: box-shadow 0.2s, transform 0.2s;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: center;
            overflow: hidden;
        }
        .card:hover {
            box-shadow: 0 4px 18px rgba(25, 118, 210, 0.13);
            transform: translateY(-3px) scale(1.03);
        }
        .card .img-container {
            width: 100%;
            height: 120px;
            background: #e3eaf6;
            display: flex;
            align-items: center;
            justify-content: center;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
            overflow: hidden;
        }
        .card img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 0;
            margin: 0;
            background: #e3eaf6;
        }
        .card p {
            margin: 10px 0 0 0;
            font-size: 1em;
            color: #222;
            width: 90%;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        .precio {
            color: #2e7d32 !important;
            font-weight: bold;
            font-size: 1.1em;
            margin-top: 4px;
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
            .cards {
                grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
                gap: 12px;
                padding: 10px;
            }
            .card {
                width: 150px;
                height: 180px;
            }
            .card .img-container {
                height: 90px;
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
<%
    // Paginación igual que en inicio.gsp
    int page = params.int('page') ?: 1
    int pageSize = 5
    int total = misArticulos?.size() ?: 0
    int totalPages = (total / pageSize).toInteger() + ((total % pageSize) > 0 ? 1 : 0)
    int fromIdx = (page - 1) * pageSize
    int toIdx = Math.min(fromIdx + pageSize, total)
    def articulosPagina = misArticulos ? misArticulos[fromIdx..<toIdx] : []
%>
    <!-- Encabezado -->
    <div class="top-banner">
        <img src="${resource(dir:'images', file:'logo.png')}" alt="logo">
        <h3>Mis Publicaciones</h3>
    </div>
    <div class="cards">
        <g:if test="${articulosPagina?.size()}">
            <g:each in="${articulosPagina}" var="art">
                <div class="card">
                    <a href="${createLink(controller:'articulo', action:'editarBorrar', id: art.id)}" style="text-decoration:none; color:inherit;">
                        <div class="img-container">
                            <img src="${art.imagen ?: resource(dir:'images', file:'producto.png')}" alt="${art.nombre}">
                        </div>
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
    <!-- Paginación -->
    <div style="text-align:center; margin-bottom:90px;">
        <g:if test="${totalPages > 1}">
            <nav style="display:inline-block;">
                <ul style="list-style:none;display:flex;gap:8px;padding:0;margin:0;">
                    <g:if test="${page > 1}">
                        <li>
                            <a href="?page=${page-1}" style="padding:6px 12px;border-radius:6px;background:#e3eaf6;color:#1976d2;text-decoration:none;">&laquo; Anterior</a>
                        </li>
                    </g:if>
                    <g:each in="${(1..totalPages)}" var="p">
                        <li>
                            <a href="?page=${p}"
                               style="padding:6px 12px;border-radius:6px;${p==page?'background:#1976d2;color:#fff;':'background:#e3eaf6;color:#1976d2;'}text-decoration:none;">
                                ${p}
                            </a>
                        </li>
                    </g:each>
                    <g:if test="${page < totalPages}">
                        <li>
                            <a href="?page=${page+1}" style="padding:6px 12px;border-radius:6px;background:#e3eaf6;color:#1976d2;text-decoration:none;">Siguiente &raquo;</a>
                        </li>
                    </g:if>
                </ul>
            </nav>
        </g:if>
    </div>
    <!-- Menú inferior -->
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
</body>
</html>