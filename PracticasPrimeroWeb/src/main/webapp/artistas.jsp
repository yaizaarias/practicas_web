<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="app.Artista" %>
<%@ page import="java.util.List" %>

<%
    List<Artista> randomArtistas = (List<Artista>) request.getAttribute("randomArtistas");
%>

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
                <li><a href="<%= request.getContextPath() %>/artistas">Artistas</a></li>
                <li><a href="./albumes.jsp">Álbumes</a></li>
                <li><a href="<%= request.getContextPath() %>/canciones">Canciones</a></li>
                <li><a href="<%= request.getContextPath() %>/top">Top global</a></li>
                <li><a href="./novedades.jsp">Novedades</a></li>
                <li><a href="./generos.jsp">Géneros</a></li>
            </ul>
        </nav>
        
        <hr>
    </header>

    <main>

        <div class="cabecera">

            <a href="inicio" class="volver">Volver al índice</a>
            
            <% 	
				String usuarioSesion = (String) session.getAttribute("usuario"); 
			%> 
			
            <% if (usuarioSesion != null) { %>
    			<a href="logout" class="login">Cerrar sesión</a>
			<% } else { %>
    			<a href="login.jsp" class="login">Acceso</a>
			<% } %>
          
 <!----------------------BÚSQUEDA DINÁMICA ---------------------->
            <form class="buscador-superior" action="buscarArtista" method="post">
    			<input type="text" name="query" placeholder="¿Qué quieres buscar?" class="input-buscador">
    			<input type="hidden" name="origen" value="artistas">
    			<button type="submit" class="boton-buscar">Buscar</button>
			</form>

			<p class="mensaje-error">
    			<%= request.getAttribute("errorBusqueda") != null ? request.getAttribute("errorBusqueda") : "" %>
			</p>
			
            <br>
            <br>

            <h2 class="titulo-artistas">Artistas</h2>

        </div>

<!------------------------ Listas dinámicas de artistas------------------------------->
        <div class="contenido">

            <section class="centro">


                <div class="artistas">

                  	<% if (randomArtistas != null && !randomArtistas.isEmpty()) { %>
        				<% for (int i = 0; i < randomArtistas.size() && i < 3; i++) { 
        					Artista a = randomArtistas.get(i);
        				%>
            				<div class="artista">
                				<a href="<%= request.getContextPath() %>/buscarArtista?id=<%= a.getId() %>">
                    				<img src="./imgs/" alt="">
                				</a>
                				<p><%= a.getNombre() %></p>
           					</div>
        				<% } %>
    				<% } else { %>
        				<p>No hay artistas disponibles.</p>
    				<% } %>
					

                </div>
                
                <div class="artistas">

                  	<% if (randomArtistas != null && randomArtistas.size() > 3) { %>
        				<% for (int i = 3; i < randomArtistas.size() && i < 6; i++) { 
        					Artista a = randomArtistas.get(i);
        				%>
            				<div class="artista">
                				<a href="<%= request.getContextPath() %>/buscarArtista?id=<%= a.getId() %>">
                    				<img src="./imgs/" alt="">
                				</a>
                				<p><%= a.getNombre() %></p>
           					</div>
        				<% } %>
    				<% } else { %>
        				<p>No hay artistas disponibles.</p>
    				<% } %>
					

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