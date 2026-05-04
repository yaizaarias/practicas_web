<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="app.Artista" %>
<%@ page import="java.util.List" %>

<%
    List<Artista> topArtistas = (List<Artista>) request.getAttribute("topArtistas");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Sinfonía Urbana</title>
    <meta name="description" content="Web de música">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Yaiza">
    <meta name="robots" content="index, follow">
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
        
			<% 	
				String usuarioSesion = (String) session.getAttribute("usuario"); 
				String mensajeSesion = (String) session.getAttribute("sesionIniciada");
			%> 
			
			<% if (usuarioSesion != null) { %>
    			<a href="logout" class="login">Cerrar sesión</a>
			<% } else { %>
    			<a href="login.jsp" class="login">Acceso</a>
			<% } %>

			<% if (mensajeSesion != null) { %>
    			<p style="color: white; font-size: 10px; text-align: start; padding-top: 12px;">
        			<%= mensajeSesion %>
    			</p>
			<% } %>
			

 <!----------------------BÚSQUEDA DINÁMICA ---------------------->
 		 	<form class="buscador-superior" action="buscarArtista" method="post">
                <input type="text" name="query" placeholder="¿Qué artista quieres buscar?" class="input-buscador">
                <input type="hidden" name="origen" value="index">
                <button type="submit" class="boton-buscar">Buscar</button>
            </form>
            
            <p class="mensaje-error">
    			<%= request.getAttribute("errorBusqueda") != null ? request.getAttribute("errorBusqueda") : "" %>
			</p>

            <p>Descubre música y la información de tus artistas favoritos con un solo click!</p>
    
        </div>

        <div class="contenido">

<!------------------------ Listas dinámicas de artistas------------------------------->
            <section class="centro">

                <h2>Artistas más buscados</h2>

                <div class="artistas" id="listaArtistas">

                    <% if (topArtistas != null && !topArtistas.isEmpty()) { %>
        				<% for (int i = 0; i < 5; i++) { 
        					Artista a = topArtistas.get(i);%>
        					
            				<div class="artista">
                				<a href="<%= request.getContextPath() %>/buscarArtista?id=<%= a.getId() %>">
                    				<img src="../imgs/" alt="">
                				</a>
                				<p><%= a.getNombre() %></p>
            				</div>
        				<% } %>
    				<% } else { %>
        				<p>No hay artistas disponibles.</p>
    				<% } %>

                </div>

            </section>

<!--------------------------- Filtros dinámicos-------------------------------------->
            <section class="filtros">

                <h2>Filtros</h2>

                <h3>Género</h3>
                <select id="filtroGenero">
                    <option value="">Todos</option>
                    <option value="pop">Pop</option>
                    <option value="rap">Rap</option>
                    <option value="reggaeton">Reggaeton</option>
                    <option value="trap">Trap</option>
                    <option value="rnb">R&B</option>
                </select>

                <h3>Idioma</h3>
                <select id="filtroIdioma">
                    <option value="">Todos</option>
                    <option value="espanol">Español</option>
                    <option value="ingles">Inglés</option>
                </select>

                <h3>Popularidad</h3>
                <select id="filtroPopularidad">
                    <option value="">Todos</option>
                    <option value="MasEscuchados">Más escuchados</option>
                    <option value="MenosEscuchados">Menos escuchados </option>
                </select>

                <h3>Año</h3>
                <select id="filtroAno">
                    <option value="todos">Todos</option>
                    <option value="2020-2026">2020-2026</option>
                    <option value="2010-2020">2010-2020</option>
                    <option value="MasAntiguo"> Más antiguo</option>
                </select>


                <button onclick="filtrar()">Aplicar filtros</button>

            </section>

        </div>

    </main>

    <footer>
        <div class="footer-content">
            <div>
                <h4>Proyecto</h4>
                <p> Sinfonía Urbana </p>
            </div>
            
            <div>
                <h4>Contacto</h4>
                <p>yaiza5arias@gmail.com</p>
            </div>
        </div>
    </footer>

</body>

</html>