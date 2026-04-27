<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <!DOCTYPE html>
    <html lang="es">

    <head>
        <title>Album - Sinfonía Urbana</title>
        <meta charset="UTF-8">
        <meta name="description" content="Artistas musicales">
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

                <a href="inicio" class="volver">Volver al índice</a>

                <% String usuarioSesion=(String) session.getAttribute("usuario"); %>

                    <% if (usuarioSesion !=null) { %>
                        <a href="logout" class="login">Cerrar sesión</a>
                    <% } else { %>
                        <a href="login.jsp" class="login">Acceso</a>
                    <% } %>

            <!----------------------BÚSQUEDA DINÁMICA ---------------------->
                    <form class="buscador-superior" action="buscarAlbum" method="post">
                        <input type="text" name="query" placeholder="¿Qué canción quieres buscar?" class="input-buscador">
                        <button type="submit" class="boton-buscar">Buscar</button>
                    </form>
                    <br>
                    <br>

                                <h2 class="titulo-artistas">Álbumes</h2>

            </div>

            <!------------------------ Listas dinámicas de Álbumes------------------------------->
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