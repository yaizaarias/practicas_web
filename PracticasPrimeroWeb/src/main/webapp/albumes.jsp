<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="app.Cancion"%>
<%@ page import="app.Albumes"%>

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

        <a href="index.jsp" class="volver">Volver al índice</a>

        <%
        String usuarioSesion = (String) session.getAttribute("usuario");
        %>

        <%
        if (usuarioSesion != null) {
        %>
            <a href="logout" class="login">Cerrar sesión</a>
        <%
        } else {
        %>
            <a href="login.jsp" class="login">Acceso</a>
        <%
        }
        %>

        <!-- BUSQUEDA -->
        <%
        Albumes album = (Albumes) request.getAttribute("album");
        List<Cancion> canciones = (List<Cancion>) request.getAttribute("canciones");
        %>

        <form action="BuscarAlbumServlet" method="post">
            <input type="text" name="album" placeholder="Buscar álbum">
            <button type="submit">Buscar</button>
        </form>

        <!-- ERROR -->
        <%
        if (request.getAttribute("error") != null) {
        %>
            <p style="color: red">
                <%=request.getAttribute("error")%>
            </p>
        <%
        }
        %>

    </div>

    <section class="centro">

        <%
        if (album != null && canciones != null && !canciones.isEmpty()) {
        %>

        <h2><%=album.getTitulo()%></h2>

        <div class="bloque-top-canciones">
            <h3 class="titulo-top">Canciones del álbum</h3>

            <div class="topCanciones">

                <%
                for (Cancion c : canciones) {
                %>

                <div class="cancion">
                    <img src="imgs/default.jpg" alt="">
                    <p><%=c.getTitulo()%></p>
                    <p><%=c.getReproducciones()%> reproducciones</p>
                </div>

                <%
                }
                %>

            </div>
        </div>

        <%
        } else if (album != null) {
        %>
            <p style="color:gray">Este álbum no tiene canciones registradas.</p>
        <%
        }
        %>

    </section>

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