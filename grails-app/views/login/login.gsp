<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="none"/>
    <meta charset="UTF-8">
    <title>Login - PuceBuy</title>
    <style>
        body {
            background: #f4f4f4;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-box {
            background-color: #fff;
            padding: 30px;
            width: 100%;
            max-width: 400px;
            border-radius: 15px;
            box-shadow: 0 0 25px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .login-box img {
            width: 120px;
            margin-bottom: 20px;
        }

        .login-box input {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #fffce0;
            box-sizing: border-box;
        }

        .login-box button {
            background-color: #000;
            color: white;
            padding: 12px;
            border: none;
            width: 100%;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
        }

        .login-box .footer-text {
            font-size: 12px;
            color: #777;
            margin-top: 15px;
        }

        .error-message {
            color: red;
            margin: 10px 0;
        }
    </style>
</head>
<body>
<div class="login-box">
    <img src="${resource(dir: 'images', file: 'logo.png')}" alt="Logo PuceBuy">
    <h2>Bienvenido a PuceBuy</h2>
    <p>Compra, vende e intercambia<br>con tu comunidad PUCE</p>

    <g:if test="${flash.message}">
        <div class="error-message">${flash.message}</div>
    </g:if>

    <g:form controller="login" action="autenticar" method="POST">
        <input type="email" name="email" placeholder="Correo institucional (@puce.edu.ec)" required />
        <input type="password" name="contrasena" placeholder="Contraseña" required />
        <button type="submit">Ingresar</button>
    </g:form>

    <div class="footer-text">
        Al continuar aceptas los Términos de Servicio y la Política de Privacidad.
    </div>
</div>
</body>
</html>
