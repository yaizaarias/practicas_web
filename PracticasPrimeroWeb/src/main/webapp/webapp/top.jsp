<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Top Global</title>
    <link rel="stylesheet" href="styles.css">
</head>

<body>

    <header>
        <h1>SinfonÌa Urbana</h1>

        <nav>
            <ul>
                <li><a href="./artistas.jsp">Artistas</a></li>
                <li><a href="./albumes.jsp">¡lbumes</a></li>
                <li><a href="./canciones.jsp">Canciones</a></li>
                <li><a href="./top.jsp">Top global</a></li>
                <li><a href="./novedades.jsp">Novedades</a></li>
                <li><a href="./generos.jsp">GÈneros</a></li>
            </ul>
        </nav>

        <hr>
    </header>

    <main>


        <div class="cabecera">
            <a href="login.jsp" class="login">Acceso</a>
            <a href="index.jsp" class="volver">Volver al Ìndice</a>
 <!----------------------B⁄öSQUEDA DIN¡MICA ---------------------->
            <input type="text" placeholder="øQuÈ quieres buscar?" id="buscador">
        </div>

<!------------ Top din·mico de 4 canciones ordenadas por reproducciones---------- -->
        <div class="contenido">


            <section class="centro">

                <h2 class="titulo-novedades">Top global</h2>
                <h3 class="subtitulo-novedades">LANZAMIENTOS M¡ÅS ESCUCHADOS</h3>

                <div class="artistas">

                    <div class="artista">
                        <h2 style="color:red;">n∞1</h2>
                        <img src="../imgs/" alt="">
                        <p>nombre canciÛn</p>
                    </div>

                    <div class="artista">
                        <h2 style="color:red;">n∞2</h2>
                        <img src="../imgs/" alt="">
                        <p>nombre canciÛn</p>
                    </div>

                    <div class="artista">
                        <h2 style="color:red;">n∞3</h2>
                        <img src="../imgs/" alt="">
                        <p>nombre canciÛn</p>
                    </div>

                    <div class="artista">
                        <h2 style="color:red;">n∞4</h2>
                        <img src="../imgs/" alt="">
                        <p>nombre canciÛn</p>
                    </div>

                </div>

            </section>

        </div>

    </main>

    <footer>
        <div class="footer-content">
            <div>
                <h4>Proyecto</h4>
                <p>SinfonÌa Urbana</p>
            </div>

            <div>
                <h4>Contacto</h4>
                <p>yaiza5arias@gmail.com</p>
            </div>
        </div>
    </footer>

</body>

</html>