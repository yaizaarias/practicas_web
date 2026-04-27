<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="app.Albumes" %>

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

			<!---------------------- BÚSQUEDA DINÁMICA ---------------------->
			<form action="AlbumServlet" method="get">
				<input type="text" name="titulo" placeholder="¿Qué quieres buscar?">
				<button type="submit">Buscar</button>
			</form>

			<br><br>

			<h2 class="titulo-artistas">Álbumes</h2>

		</div>

		<!------------------------ LISTA DINÁMICA ------------------------------>
		<div class="contenido">

			<section class="centro">

				<div class="artistas">

					<%
					List<Albumes> albumes = (List<Albumes>) request.getAttribute("albumes");

					if (albumes != null && !albumes.isEmpty()) {
					    for (Albumes a : albumes) {
					%>

					<div class="artista">
						<img src="../imgs/" alt="">
						<p><%= a.getTitulo() %></p>
					</div>

					<%
					    }
					} else {
					%>

					<p>No hay álbumes disponibles</p>

					<%
					}
					%>

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