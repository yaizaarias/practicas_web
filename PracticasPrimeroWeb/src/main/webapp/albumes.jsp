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

				<li><a href="<%=request.getContextPath()%>/albumes">
						Álbumes </a></li>

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

			<form class="buscador-superior"
				action="<%=request.getContextPath()%>/buscarAlbum" method="post">

				<input type="text" name="album"
					placeholder="¿Qué quieres buscar?"
					class="input-buscador">

				<button type="submit" class="boton-buscar">Buscar</button>

			</form>

			<br>
			<br>

			<h2 class="titulo-artistas">Álbumes</h2>

		</div>

		<div class="contenido">

			<section class="centro">

				<%
				List<Cancion> canciones = (List<Cancion>) request.getAttribute("canciones");
				List<Cancion> randoms = (List<Cancion>) request.getAttribute("randoms");
				String error = (String) request.getAttribute("error");
				Albumes album = (Albumes) request.getAttribute("album");
				%>

				<div class="artistas">

					<%
					if (error != null) {
					%>

					<p style="color: red; font-size: 18px;">
						<%= error %>
					</p>

					<%
					} else if (canciones != null && !canciones.isEmpty()) {

						for (Cancion c : canciones) {
					%>

					<div class="artista">

						<img src="imgs/default.jpg" alt="">

						<p>
							<a href="<%= c.getUrl() %>" target="_blank"
								style="color: red; text-decoration: none; font-weight: bold;">

								<%= c.getTitulo() %>

							</a>
						</p>

					</div>

					<%
						}

					} else if (album != null) {
					%>

					<div class="artista">

						<img src="imgs/default.jpg" alt="">

						<p><%= album.getTitulo() %></p>

					</div>

					<%
					} else if (randoms != null) {

						for (Cancion c : randoms) {
					%>

					<div class="artista">

						<img src="imgs/default.jpg" alt="">

						<p>
							<a href="<%= c.getUrl() %>" target="_blank"
								style="color: red; text-decoration: none; font-weight: bold;">

								<%= c.getTitulo() %>

							</a>
						</p>

					</div>

					<%
						}
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