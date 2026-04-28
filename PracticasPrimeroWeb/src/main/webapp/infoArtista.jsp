<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="app.Artista" %>
<%@ page import="app.Cancion" %>
<%@ page import="java.util.List" %>

<%
    Artista artista = (Artista) request.getAttribute("artista");
    List<Cancion> canciones = (List<Cancion>) request.getAttribute("canciones");
    String usuarioSesion = (String) session.getAttribute("usuario");
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="SinfonÃ­a Urbana">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Cristina">
    <link rel="stylesheet" href="styles.css">
    <title>Información artista - Sinfonía Urbana</title>
</head>

<body>

    <header>
        <h1>Sinfonía Urbana</h1>

        <nav>
            <ul>
                <li><a href="<%= request.getContextPath() %>/artistas">Artistas</a></li>
                <li><a href="./albumes.jsp">Álbumes</a></li>
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

            <a href="inicio" class="volver">Volver al índice</a>
			
            <% if (usuarioSesion != null) { %>
    			<a href="logout" class="login">Cerrar sesión</a>
			<% } else { %>
    			<a href="login.jsp" class="login">Acceso</a>
			<% } %>
			
            <!----------------------BÚSQUEDA DINÁMICA ---------------------->

            <form class="buscador-superior" action="buscarArtista" method="post">
    			<input type="text" name="query" placeholder="¿Qué canción quieres buscar?" class="input-buscador">
    			<input type="hidden" name="origen" value="infoArtista">
    			<input type="hidden" name="artistaActualId" value="<%= artista != null ? artista.getId() : "" %>">
    			<button type="submit" class="boton-buscar">Buscar</button>
			</form>

			<p class="mensaje-error">
    			<%= request.getAttribute("errorBusqueda") != null ? request.getAttribute("errorBusqueda") : "" %>
			</p>
            
            <br>
            <br>

        </div>
        <!------------------------ Información dinámica del artista seleccionado------------------------------->
        
        <% if (artista != null) { %>
        	<div class="contenido-artista">
            
            	<div class="datos-artista">
                	<h3>Datos</h3>
                	<h4>Edad: <%= artista.getEdad() %></h4>
                	<h4>Oyentes mensuales: <%= artista.getOyentesMensuales() %></h4>
                	<h4>Total de canciones: <%= request.getAttribute("totalCanciones") != null ? request.getAttribute("totalCanciones") : 0 %></h4>
                	<h4>Nació en: <%= artista.getPais() %></h4>
                	<h4>Productor habitual: <%= artista.getProductor() %></h4>
            	</div>

            	<div class="artistaInfo">
                	<h2 class="titulo-info">✨ <%= artista.getNombre().toUpperCase() %> ✨</h2>
                	<br>
                	<img src="../imgs/" alt="">
                	<p><%= artista.getBiografia() %></p>
            	</div>
        	</div>

        	<div class="bloque-top-canciones">
            	<h3 class="titulo-top">Top canciones</h3>

            	<div class="topCanciones">
                	<% if (canciones != null && !canciones.isEmpty()) { %>
                        <% for (Cancion c : canciones) { %>
                            <div class="cancion">
                                <img src="../imgs/" alt="">
                                <p><%= c.getTitulo() %></p>
                                <p><%= c.getReproducciones() %> reproducciones</p>
                            </div>
                        <% } %>
                    <% } else { %>
                        <p>No hay canciones disponibles para este artista.</p>
                    <% } %>
            	</div>
        	</div>
        <% } else { %>

        	<div class="contenido-artista">
            	<p>No se ha encontrado información del artista.</p>
        	</div>
    	<% } %>
    	
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