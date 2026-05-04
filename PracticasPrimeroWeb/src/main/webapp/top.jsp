<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="app.Cancion" %>
<%@ page import="java.util.List" %>

<%
    List<Cancion> topCanciones = (List<Cancion>) request.getAttribute("topCanciones");
%>

<!DOCTYPE html>
<html lang="es">

<head>
    	<title>Top Global - Sinfonía Urbana</title>
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
			
 <!----------------------BÚSQUEDA DINÁMICA ---------------------->
            <form class="buscador-superior" action="buscarCancion" method="post">
    			<input type="text" name="query" placeholder="¿Qué canción quieres escuchar?" class="input-buscador">
    			<button type="submit" class="boton-buscar">Buscar</button>
			</form>

			<p class="mensaje-error">
    			<%= request.getAttribute("errorBusqueda") != null ? request.getAttribute("errorBusqueda") : "" %>
			</p>
            
        </div>

<!------------ Top dinámico de 4 canciones ordenadas por reproducciones---------- -->
        <div class="contenido">


            <section class="centro">

                <h2 class="titulo-novedades">Top global</h2>
                <h3 class="subtitulo-novedades">LANZAMIENTOS MÁS ESCUCHADOS</h3>

                <div class="artistas">
                
                	<% if (topCanciones != null && !topCanciones.isEmpty()) { %>
        				<% for (int i = 0; i < topCanciones.size() && i < 4; i++) {
               					Cancion c = topCanciones.get(i);
       				 	%>
            				<div class="cancion" data-url="<%= c.getUrl() %>" onclick="abrirVideo(this)">
            					<% int puesto = i + 1; %>
								<h2 style="color:red;">#<%= puesto %></h2>
                				<img src="../imgs/" alt="">
                				<p><%= c.getTitulo() %></p>
            				</div>
        				<% } %>
    				<% } else { %>
        				<p>No hay canciones disponibles.</p>
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
    
    <script>
    	function abrirVideo(elemento) {
        	const url = elemento.getAttribute("data-url");

        	if (url && url.trim() !== "") {
            	window.open(url, "_blank");
        	} else {
           		alert("Esta canción no tiene videoclip disponible.");
        	}
    	}
	</script>

</body>

</html>