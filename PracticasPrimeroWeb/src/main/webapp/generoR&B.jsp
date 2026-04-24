<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <title>Géneros - Sinfonía Urbana</title>
    <meta charset="UTF-8">
    <meta name="description" content="GÃ©neros musicales">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Yaiza">
    <link rel="stylesheet" href="styles.css">
</head>

<body>

    <header>
        <h1>Sinfonía Urbana</h1>

        <nav>
            <ul>
                <li><a href="./artistas.jsp">Artistas</a></li>
                <li><a href="./albumes.jsp">Álbumes</a></li>
                <li><a href="./canciones.jsp">Canciones</a></li>
                <li><a href="./top.jsp">Top global</a></li>
                <li><a href="./novedades.jsp">Novedades</a></li>
                <li><a href="./generos.jsp">Géneros</a></li>
            </ul>
        </nav>
        
        <hr>
    </header>

    <main>

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
			
             <!----------------------BÚSQUEDA DINÁMICA ---------------------->
            <input type="text" placeholder="¿Qué quieres buscar?" id="buscador">

            <h2><i>Género:</i> <span class="genero-titulo">R&B</span></h2>

        </div>

<!------------------Filtro dinámico de música de género R&B  ----------->
        <div class="contenido">


            <section class="centro">

                <div class="artistas">

                    <div class="artista">
                        <img src="../imgs/" alt="">
                        <p>nombre Álbum</p>
                    </div>

                    <div class="artista">
                        <img src="../imgs/" alt="">
                        <p>nombre Álbum</p>
                    </div>

                    <div class="artista">
                        <img src="../imgs/" alt="">
                        <p>nombre Álbum</p>
                    </div>

                </div>

                <div class="artistas">

                    <div class="artista">
                        <img src="../imgs/" alt="">
                        <p>nombre Álbum</p>
                    </div>

                    <div class="artista">
                        <img src="../imgs/" alt="">
                        <p>nombre Álbum</p>
                    </div>

                    <div class="artista">
                        <img src="../imgs/" alt="">
                        <p>nombre Álbum</p>
                    </div>

                </div>

            </section>
<!------------------Filtro dinámico de los géneros será con un WHERE género = 'Pop' / 'Rap' etc ----------->
            <section class="filtros">

                <h2>Géneros</h2>

                <a href="./generos.jsp">Pop</a>
                <a href="./generorap.jsp">Rap</a>
                <a href="./generoReggaeton.jsp">Reggaeton</a>
                <a href="./generoTrap.jsp">Trap</a>
                <a href="./generoR&B.jsp">R&B</a>

            </section>

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