<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="SinfonÃ­a Urbana">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Cristina">
    <link rel="stylesheet" href="styles.css">
    <title>Document</title>
</head>

<body>

    <header>
        <h1>Sinfonía Urbana</h1>

        <nav>
            <ul>
                <li><a href="./artistas.jsp">Artistas</a></li>
                <li><a href="./albumes.jsp">Ãlbumes</a></li>
                <li><a href="./canciones.jsp">Canciones</a></li>
                <li><a href="./top.jsp">Top global</a></li>
                <li><a href="./novedades.jsp">Novedades</a></li>
                <li><a href="./generos.jsp">Géneros</a></li>
            </ul>
        </nav>

        <hr>
    </header>

    <main class="detalles">
        <div class="cabecera">

            <a href="./index.jsp" class="volver">Volver al índice</a>
            
            <% 	
				String usuarioSesion = (String) session.getAttribute("usuario"); 
			%> 
			
            <% if (usuarioSesion != null) { %>
    			<a href="logout" class="login">Cerrar sesión</a>
			<% } else { %>
    			<a href="login.jsp" class="login">Acceso</a>
			<% } %>
			
            <!----------------------BÚSQUEDA DINÁMICA ---------------------->

            <input type="text" placeholder="¿Qué quieres buscar? " id="buscador">
            <br>
            <br>

        </div>
        <!------------------------ Información dinámica del artista seleccionado------------------------------->
        <div class="contenido-artista">
            
            <div class="datos-artista">
                <h3>Datos</h3>
                <h4>Edad:</h4>
                <h4>Oyentes mensuales:</h4>
                <h4>Total de canciones:</h4>
                <h4>Nació en:</h4>
                <h4>Productor habitual:</h4>
            </div>

            <div class="artistaInfo">
                <h2 class="titulo-info">✨ NOMBRE DEL ARTISTA ✨</h2>
                <br>
                <img src="../imgs/" alt="">
                <p>
                    Aquí irá una mini biografía del artista, explicando por qué empezó
                    a hacer música, sus motivaciones y otra información de interés.
                </p>
            </div>
        </div>

        <div class="bloque-top-canciones">
            <h3 class="titulo-top">Top canciones</h3>

            <div class="topCanciones">
                <div class="cancion">
                    <img src="../imgs/" alt="">
                    <p>nombre canción</p>
                    <p>xxxx visualizaciones</p>
                </div>

                <div class="cancion">
                    <img src="../imgs/" alt="">
                    <p>nombre canción</p>
                    <p>xxxx visualizaciones</p>
                </div>

                <div class="cancion">
                    <img src="../imgs/" alt="">
                    <p>nombre canción</p>
                    <p>xxxx visualizaciones</p>
                </div>

                <div class="cancion">
                    <img src="../imgs/" alt="">
                    <p>nombre canción</p>
                    <p>xxxx visualizaciones</p>
                </div>

                <div class="cancion">
                    <img src="../imgs/" alt="">
                    <p>nombre canción</p>
                    <p>xxxx visualizaciones</p>
                </div>
            </div>
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