<!DOCTYPE html>
<html lang="es">

<head>
    <title>Artistas - Sinfonía Urbana</title>
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

            <a href="./index.jsp" class="volver">Volver al índice</a>
            <a href="./login.jsp" class="login">Acceso</a>
          
 <!----------------------BÃšSQUEDA DINÃMICA ---------------------->
            <input type="text" placeholder="¿Qué quieres buscar?" id="buscador">

            <h2 class="titulo-artistas">Canciones</h2>

        </div>

<!------------------------ Listas dinámicas de canciones----------------------------->
        <div class="contenido">


            <section class="centro">


                <div class="artistas">

                    <div class="artista">
                        <img src="../imgs/" alt="">
                        <p>nombre canción</p>
                    </div>

                    <div class="artista">
                        <img src="../imgs/" alt="">
                        <p>nombre canción</p>
                    </div>

                    <div class="artista">
                        <img src="../imgs/" alt="">
                        <p>nombre canción </p>
                    </div>

                </div>

                <div class="artistas">

                    <div class="artista">
                        <img src="../imgs/" alt="">
                        <p>nombre canción </p>
                    </div>

                    <div class="artista">
                        <img src="../imgs/" alt="">
                        <p>nombre canción </p>
                    </div>

                    <div class="artista">
                        <img src="../imgs/" alt="">
                        <p>nombre canción </p>
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