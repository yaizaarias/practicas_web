<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <title>Login - Sinfonía Urbana</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Yaiza">
    <link rel="stylesheet" href="styles.css">
</head>

<body>

    <header>
        <h1>Sinfonía Urbana</h1>
    </header>

    <main>


        <div class="cabecera">

            <a href="index.jsp" class="volver">Volver al índice</a>
            <h2 class="titulo-login">Acceso</h2>

        </div>

<!--------------Validación dinámica para entrar en el modo administrador -------------------->
        <div class="login-container">

            <form class="login-form" action="login" method="post">

                <input type="text" name="usuario" placeholder="Usuario" required>

                <input type="password" name="contrasena" placeholder="Contraseña" required>

                <button type="submit">Entrar</button>
                
                <p class="mensaje-error"  style="color: red;">
    				<%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
				</p>

            </form>

        </div>

    </main>

    <footer>
        <div class="footer-content">
            <div>
                <h4>Proyecto</h4>
                <p>Sinfonía Urbana</p>
            </div>

            <div>
                <h4>Contacto</h4>
                <p>yaiza5arias@gmail.com</p>
            </div>
        </div>
    </footer>

</body>

</html>